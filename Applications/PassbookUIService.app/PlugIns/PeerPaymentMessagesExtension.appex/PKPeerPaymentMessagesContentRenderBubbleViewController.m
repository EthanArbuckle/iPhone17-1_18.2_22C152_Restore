@interface PKPeerPaymentMessagesContentRenderBubbleViewController
- (BOOL)_isMessage:(id)a3 validForTransaction:(id)a4;
- (BOOL)_isMessageFromMe:(id)a3;
- (CGSize)contentSizeThatFits:(CGSize)a3;
- (id)bubbleView;
- (id)generatedSnapshot;
- (void)_bubbleViewDoubleTapped;
- (void)_bubbleViewLongPressed;
- (void)_bubbleViewPanned;
- (void)_bubbleViewSelected;
- (void)_fetchStatus;
- (void)_resizeBubbleViewToReferenceSizeAnimated;
- (void)_resizeBubbleViewToSize:(CGSize)a3 completion:(id)a4;
- (void)loadView;
- (void)reloadContent;
@end

@implementation PKPeerPaymentMessagesContentRenderBubbleViewController

- (void)loadView
{
  bubbleView = self->_bubbleView;
  if (!bubbleView)
  {
    v4 = (PKPeerPaymentBubbleView *)objc_alloc_init((Class)PKPeerPaymentBubbleView);
    v5 = self->_bubbleView;
    self->_bubbleView = v4;

    [(PKPeerPaymentBubbleView *)self->_bubbleView setDisplaysApplePayLogo:1];
    [(PKPeerPaymentBubbleView *)self->_bubbleView setLiveRenderingEnabled:1];
    id v6 = [objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:self action:"_bubbleViewPanned"];
    [(PKPeerPaymentBubbleView *)self->_bubbleView addGestureRecognizer:v6];
    id v7 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_bubbleViewDoubleTapped"];
    [v7 setNumberOfTapsRequired:2];
    [(PKPeerPaymentBubbleView *)self->_bubbleView addGestureRecognizer:v7];
    id v8 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"_bubbleViewLongPressed"];
    [(PKPeerPaymentBubbleView *)self->_bubbleView addGestureRecognizer:v8];
    id v9 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_bubbleViewSelected"];
    [v9 setNumberOfTapsRequired:1];
    [v9 requireGestureRecognizerToFail:v6];
    [v9 requireGestureRecognizerToFail:v7];
    [v9 requireGestureRecognizerToFail:v8];
    [(PKPeerPaymentBubbleView *)self->_bubbleView addGestureRecognizer:v9];
    objc_initWeak(&location, self);
    v10 = self->_bubbleView;
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = sub_100005530;
    v14 = &unk_100024A58;
    objc_copyWeak(&v15, &location);
    [(PKPeerPaymentBubbleView *)v10 setActionHandler:&v11];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

    bubbleView = self->_bubbleView;
  }
  -[PKPeerPaymentMessagesContentRenderBubbleViewController setView:](self, "setView:", bubbleView, v11, v12, v13, v14);
}

- (void)reloadContent
{
  v3 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
  v4 = [v3 activeConversation];
  v5 = [v4 selectedMessage];
  id v6 = [v5 peerPaymentMessage];

  currentMessage = self->_currentMessage;
  if (!currentMessage
    || ([(PKPeerPaymentMessage *)currentMessage identifier],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v6 identifier],
        id v9 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v10 = [v8 isEqual:v9],
        v9,
        v8,
        (v10 & 1) == 0))
  {
    objc_storeStrong((id *)&self->_currentMessage, v6);
    v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218242;
      v13 = self;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: rendering message : %@", (uint8_t *)&v12, 0x16u);
    }

    [(PKPeerPaymentBubbleView *)self->_bubbleView updateWithPeerPaymentMessage:v6 animated:0];
    if ([v6 type] == (id)2
      && ![(PKPeerPaymentMessagesContentRenderBubbleViewController *)self _isMessageFromMe:v6])
    {
      [(PKPeerPaymentBubbleView *)self->_bubbleView setAction:1 animated:0];
    }
    [(PKPeerPaymentBubbleView *)self->_bubbleView sizeToFit];
  }
  [(PKPeerPaymentMessagesContentRenderBubbleViewController *)self _fetchStatus];
}

- (BOOL)_isMessageFromMe:(id)a3
{
  v4 = [a3 underlyingMessage];
  v5 = [v4 senderParticipantIdentifier];

  id v6 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
  id v7 = [v6 activeConversation];
  id v8 = [v7 localParticipantIdentifier];

  unsigned __int8 v9 = 0;
  if (v5 && v8) {
    unsigned __int8 v9 = [v5 isEqual:v8];
  }

  return v9;
}

- (BOOL)_isMessage:(id)a3 validForTransaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 peerPaymentMessageReceivedDate];
  unsigned __int8 v9 = [v6 underlyingMessage];
  unsigned __int8 v10 = [v9 time];

  if ([(PKPeerPaymentMessagesContentRenderBubbleViewController *)self _isMessageFromMe:v6])
  {
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 1;
    if ([v6 hasBeenSent])
    {
      if (v8)
      {
        if (v10)
        {
          [v8 timeIntervalSinceDate:v10];
          if (fabs(v12) >= 1.0)
          {
            v13 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              int v15 = 134219010;
              v16 = self;
              __int16 v17 = 2112;
              id v18 = v6;
              __int16 v19 = 2112;
              id v20 = v7;
              __int16 v21 = 2114;
              v22 = v10;
              __int16 v23 = 2114;
              v24 = v8;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Message: %@ is not valid for Transaction: %@. (%{public}@ != %{public}@)", (uint8_t *)&v15, 0x34u);
            }

            BOOL v11 = 0;
          }
        }
      }
    }
  }

  return v11;
}

- (id)bubbleView
{
  return self->_bubbleView;
}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PKPeerPaymentMessagesContentRenderBubbleViewController *)self loadViewIfNeeded];
  if (!self->_currentMessage) {
    [(PKPeerPaymentMessagesContentRenderBubbleViewController *)self reloadContent];
  }
  double v6 = CGSizeZero.height;
  double v7 = self->_pendingBubbleViewSize.width;
  double v8 = self->_pendingBubbleViewSize.height;
  if (CGSizeZero.width == v7 && v6 == v8) {
    -[PKPeerPaymentBubbleView sizeThatFits:](self->_bubbleView, "sizeThatFits:", width, height, CGSizeZero.width, v6);
  }
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (id)generatedSnapshot
{
  return [(PKPeerPaymentBubbleView *)self->_bubbleView generatedSnapshot];
}

- (void)_fetchStatus
{
  objc_initWeak(&location, self);
  v3 = self->_currentMessage;
  if (PKUseMockSURFServer())
  {
    if ([(PKPeerPaymentMessage *)v3 type] == (id)1)
    {
      [(PKPeerPaymentBubbleView *)self->_bubbleView setAction:0 animated:0];
      [(PKPeerPaymentBubbleView *)self->_bubbleView setState:5 animated:0];
    }
    [(PKPeerPaymentMessagesContentRenderBubbleViewController *)self _resizeBubbleViewToReferenceSizeAnimated];
    bubbleView = self->_bubbleView;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000060E4;
    v18[3] = &unk_1000248F0;
    objc_copyWeak(&v19, &location);
    [(PKPeerPaymentBubbleView *)bubbleView performPostRender:v18];
    v5 = &v19;
  }
  else
  {
    if (!v3 || [(PKPeerPaymentMessage *)v3 type] != (id)1)
    {
      unsigned __int8 v9 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
      [v9 noteReadyForDisplay];

      goto LABEL_11;
    }
    double v6 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
    unsigned int v7 = [v6 peerPaymentRequiresEnablement];

    if (v7)
    {
      [(PKPeerPaymentBubbleView *)self->_bubbleView setState:10 animated:0];
      double v8 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
      [v8 noteReadyForDisplay];

      [(PKPeerPaymentMessagesContentRenderBubbleViewController *)self _resizeBubbleViewToReferenceSizeAnimated];
      goto LABEL_11;
    }
    if ([(PKPeerPaymentMessagesContentRenderBubbleViewController *)self _isMessageFromMe:v3]
      && ![(PKPeerPaymentMessage *)v3 hasBeenSent])
    {
      BOOL v11 = self->_bubbleView;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000069C0;
      v12[3] = &unk_100024B20;
      objc_copyWeak(&v13, &location);
      v12[4] = self;
      [(PKPeerPaymentBubbleView *)v11 performPostRender:v12];
      v5 = &v13;
    }
    else
    {
      unsigned __int8 v10 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100006140;
      v14[3] = &unk_100024AF8;
      objc_copyWeak(&v17, &location);
      int v15 = v3;
      v16 = self;
      [v10 localStatusForMessage:v15 completion:v14];

      v5 = &v17;
    }
  }
  objc_destroyWeak(v5);
LABEL_11:

  objc_destroyWeak(&location);
}

- (void)_resizeBubbleViewToReferenceSizeAnimated
{
  [(PKPeerPaymentBubbleView *)self->_bubbleView referenceSize];

  -[PKPeerPaymentMessagesContentRenderBubbleViewController _resizeBubbleViewToSize:completion:](self, "_resizeBubbleViewToSize:completion:", 0);
}

- (void)_resizeBubbleViewToSize:(CGSize)a3 completion:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  unsigned int v7 = (void (**)(void))a4;
  objc_initWeak(&location, self);
  double v8 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
  [v8 contentSize];
  double v10 = v9;
  double v12 = v11;

  id v13 = PKLogFacilityTypeGetObject();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (width == v10 && height == v12)
  {
    if (v14)
    {
      v30.double width = width;
      v30.double height = height;
      int v15 = NSStringFromSize(v30);
      *(_DWORD *)buf = 134218242;
      v25 = self;
      __int16 v26 = 2114;
      id v27 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: No bubble view resize needed. Size: %{public}@.", buf, 0x16u);
    }
    if (v7) {
      v7[2](v7);
    }
  }
  else
  {
    if (v14)
    {
      v31.double width = width;
      v31.double height = height;
      NSStringFromSize(v31);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      v32.double width = v10;
      v32.double height = v12;
      id v17 = NSStringFromSize(v32);
      *(_DWORD *)buf = 134218498;
      v25 = self;
      __int16 v26 = 2114;
      id v27 = v16;
      __int16 v28 = 2114;
      v29 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Resize bubble view to size: %{public}@ content size: %{public}@.", buf, 0x20u);
    }
    self->_pendingBubbleViewSize.double width = width;
    self->_pendingBubbleViewSize.double height = height;
    id v18 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
    [v18 noteContentSizeNeedsUpdate];

    dispatch_time_t v19 = dispatch_time(0, 800000000);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100006D38;
    v20[3] = &unk_100024B48;
    objc_copyWeak(v22, &location);
    v20[4] = self;
    v22[1] = *(id *)&width;
    v22[2] = *(id *)&height;
    __int16 v21 = v7;
    dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, v20);

    objc_destroyWeak(v22);
  }
  objc_destroyWeak(&location);
}

- (void)_bubbleViewSelected
{
  v3 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
  v4 = [v3 activeConversation];
  v5 = [v4 selectedMessage];
  double v6 = [v5 peerPaymentMessage];

  if (!v6) {
    goto LABEL_11;
  }
  if ([v6 type] == (id)1
    && [v6 hasBeenSent]
    && [(PKPeerPaymentBubbleView *)self->_bubbleView state] != (id)9)
  {
    double v9 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
    [v9 handleAction:6 sender:self completion:0];
LABEL_13:

    goto LABEL_14;
  }
  if ([v6 type] != (id)3 || !objc_msgSend(v6, "hasBeenSent"))
  {
LABEL_11:
    double v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218242;
      double v11 = self;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Ignoring bubble tap on message: %@", (uint8_t *)&v10, 0x16u);
    }
    goto LABEL_13;
  }
  if ([v6 isFromMe]) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = 5;
  }
  double v8 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
  [v8 handleAction:v7 sender:self completion:0];

LABEL_14:
}

- (void)_bubbleViewPanned
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Pan gesture detected. Not showing transaction details.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_bubbleViewDoubleTapped
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Double tap gesture detected. Not showing transaction details.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_bubbleViewLongPressed
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Long press gesture detected. Not showing transaction details.", (uint8_t *)&v4, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentMessage, 0);

  objc_storeStrong((id *)&self->_bubbleView, 0);
}

@end