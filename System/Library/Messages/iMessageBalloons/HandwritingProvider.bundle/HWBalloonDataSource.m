@interface HWBalloonDataSource
- (BOOL)canProvideSize;
- (BOOL)shouldAnimate;
- (CGSize)sizeThatFits:(CGSize)a3;
- (HWAbstractBalloonController)balloonController;
- (HWBalloonDataSource)initWithMessageGUID:(id)a3 payload:(id)a4 dataDetectedResult:(id)a5 url:(id)a6;
- (HWHandwritingItem)handwritingFromPayload;
- (unint64_t)playbackType;
- (void)playbackWithCompletionBlock:(id)a3;
- (void)setBalloonController:(id)a3;
- (void)stopPlayback;
- (void)thumbnailURLWithSize:(CGSize)a3 completion:(id)a4;
@end

@implementation HWBalloonDataSource

- (HWBalloonDataSource)initWithMessageGUID:(id)a3 payload:(id)a4 dataDetectedResult:(id)a5 url:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)HWBalloonDataSource;
  v6 = [(HWBalloonDataSource *)&v8 initWithMessageGUID:a3 payload:a4 dataDetectedResult:a5 url:a6];
  if (v6 && qword_335F0 != -1) {
    dispatch_once(&qword_335F0, &stru_28660);
  }
  return v6;
}

- (BOOL)canProvideSize
{
  return 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(HWBalloonDataSource *)self handwritingFromPayload];
  v6 = [v5 drawing];
  int IsValid = DKDrawingIsValid();

  if (IsValid)
  {
    double v8 = fmin(width, 1.79769313e308);
    if (height >= v8 / 2.5) {
      double v9 = v8 / 2.5;
    }
    else {
      double v9 = height;
    }
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    CGRect v24 = CGRectInset(*(CGRect *)(&v8 - 2), 0.0, 0.0);
    double v12 = v24.size.width;
    double v13 = v24.size.height;
    v14 = objc_msgSend(v5, "drawing", v24.origin.x, v24.origin.y);
    +[DKInkThumbnailRenderer sizeForDrawing:inSize:](DKInkThumbnailRenderer, "sizeForDrawing:inSize:", v14, v12, v13);
    double v16 = v15;
    double v18 = v17;

    double v19 = ceil(v16 + 0.0);
    double v20 = ceil(v18 + 0.0);
  }
  else
  {
    double v19 = *(double *)&HWEmptyBubbleWidth;
    double v20 = *(double *)&HWEmptyBubbleHeight;
  }

  double v21 = v19;
  double v22 = v20;
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (void)thumbnailURLWithSize:(CGSize)a3 completion:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  double v8 = [(HWBalloonDataSource *)self handwritingFromPayload];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_4168;
  v10[3] = &unk_285F8;
  id v11 = v7;
  id v9 = v7;
  +[HWAbstractBalloonController _writeThumbnailOfHandwriting:atSize:useHighFidelityInk:toDiskWithCompletionHandler:](HWAbstractBalloonController, "_writeThumbnailOfHandwriting:atSize:useHighFidelityInk:toDiskWithCompletionHandler:", v8, 0, v10, width, height);
}

- (HWHandwritingItem)handwritingFromPayload
{
  v3 = [(HWBalloonDataSource *)self payload];
  if (v3 && !self->_cachedHandwritingItem)
  {
    v4 = +[HWEncoding decodeHandwritingFromData:v3];
    cachedHandwritingItem = self->_cachedHandwritingItem;
    self->_cachedHandwritingItem = v4;
  }
  v6 = self->_cachedHandwritingItem;

  return v6;
}

- (BOOL)shouldAnimate
{
  if ([(HWBalloonDataSource *)self isPlayed])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    unsigned int v3 = [(HWBalloonDataSource *)self isLast];
    if (v3) {
      LOBYTE(v3) = [(HWBalloonDataSource *)self isFromMe] ^ 1;
    }
  }
  return v3;
}

- (unint64_t)playbackType
{
  return 2;
}

- (void)playbackWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = [(HWBalloonDataSource *)self balloonController];
  if (v5 && ([(HWBalloonDataSource *)self isFromMe] & 1) == 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_4328;
    v6[3] = &unk_28620;
    id v7 = v4;
    [v5 playbackWithCompletionBlock:v6];
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

- (void)stopPlayback
{
  [(HWBalloonDataSource *)self markAsPlayed];
  id v3 = [(HWBalloonDataSource *)self balloonController];
  [v3 cancelPlayback];
}

- (HWAbstractBalloonController)balloonController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_balloonController);

  return (HWAbstractBalloonController *)WeakRetained;
}

- (void)setBalloonController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_balloonController);

  objc_storeStrong((id *)&self->_cachedHandwritingItem, 0);
}

@end