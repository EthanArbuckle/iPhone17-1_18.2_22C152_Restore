@interface IDSOffGridMessenger
- (void)__im_donateHandlesForMessagingKeys:(id)a3 fromURI:(id)a4 priority:(int64_t)a5 isInitial:(BOOL)a6 completion:(id)a7;
- (void)__im_sendServiceUpdateMessageWithPreferredService:(int64_t)a3 recipientURI:(id)a4 fromURI:(id)a5 options:(id)a6 completion:(id)a7;
@end

@implementation IDSOffGridMessenger

- (void)__im_donateHandlesForMessagingKeys:(id)a3 fromURI:(id)a4 priority:(int64_t)a5 isInitial:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3052000000;
    v20 = __Block_byref_object_copy__0;
    v21 = __Block_byref_object_dispose__0;
    v13 = (objc_class *)getIDSOffGridDeliveryHandlesDonationOptionsClass_softClass;
    uint64_t v22 = getIDSOffGridDeliveryHandlesDonationOptionsClass_softClass;
    if (!getIDSOffGridDeliveryHandlesDonationOptionsClass_softClass)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = __getIDSOffGridDeliveryHandlesDonationOptionsClass_block_invoke;
      v16[3] = &unk_554C0;
      v16[4] = &v17;
      __getIDSOffGridDeliveryHandlesDonationOptionsClass_block_invoke((uint64_t)v16);
      v13 = (objc_class *)v18[5];
    }
    _Block_object_dispose(&v17, 8);
    id v14 = objc_alloc_init(v13);
    [v14 setPriority:a5];
    if (objc_opt_respondsToSelector()) {
      [v14 setIsInitialDonation:v8];
    }
    [(IDSOffGridMessenger *)self donateHandlesForMessagingKeys:a3 fromURI:a4 options:v14 completion:a7];
  }
  else
  {
    v15 = (void (*)(id, void, void))*((void *)a7 + 2);
    v15(a7, 0, 0);
  }
}

- (void)__im_sendServiceUpdateMessageWithPreferredService:(int64_t)a3 recipientURI:(id)a4 fromURI:(id)a5 options:(id)a6 completion:(id)a7
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3052000000;
    uint64_t v19 = __Block_byref_object_copy__0;
    v20 = __Block_byref_object_dispose__0;
    v12 = (objc_class *)getIDSOffGridServiceUpdateMessageClass_softClass;
    uint64_t v21 = getIDSOffGridServiceUpdateMessageClass_softClass;
    if (!getIDSOffGridServiceUpdateMessageClass_softClass)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = __getIDSOffGridServiceUpdateMessageClass_block_invoke;
      v15[3] = &unk_554C0;
      v15[4] = &v16;
      __getIDSOffGridServiceUpdateMessageClass_block_invoke((uint64_t)v15);
      v12 = (objc_class *)v17[5];
    }
    _Block_object_dispose(&v16, 8);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __149__IDSOffGridMessenger_ForwardDeclareSubstitute_127513240____im_sendServiceUpdateMessageWithPreferredService_recipientURI_fromURI_options_completion___block_invoke;
    v14[3] = &unk_55498;
    v14[4] = a7;
    -[IDSOffGridMessenger sendServiceUpdateMessage:options:completion:](self, "sendServiceUpdateMessage:options:completion:", [[v12 alloc] initWithPreferredServiceType:a3 senderURI:a5 recipientURI:a4], 0, v14);
  }
  else
  {
    v13 = (void (*)(id, void, void, void))*((void *)a7 + 2);
    v13(a7, 0, 0, 0);
  }
}

uint64_t __149__IDSOffGridMessenger_ForwardDeclareSubstitute_127513240____im_sendServiceUpdateMessageWithPreferredService_recipientURI_fromURI_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end