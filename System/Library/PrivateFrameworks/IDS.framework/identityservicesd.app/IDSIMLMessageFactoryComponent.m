@interface IDSIMLMessageFactoryComponent
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IDSIMLMessageFactoryComponent

- (id)runIndividuallyWithInput:(id)a3
{
  id v3 = a3;
  v33 = [v3 guid];
  id v38 = objc_alloc_init((Class)NSMutableArray);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = [v3 endpoints];
  id v4 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v37 = *(void *)v43;
    uint64_t v35 = IDSRegistrationPropertySupportsCertifiedDeliveryV1;
    uint64_t v34 = IDSSendErrorDomain;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v43 != v37) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "URI", v33);
        v9 = [v3 fromID];
        v10 = [v8 prefixedURI];
        unsigned __int8 v11 = [v9 isEqualToString:v10];

        if (v11) {
          id v12 = 0;
        }
        else {
          id v12 = [v3 wantsDeliveryStatus];
        }
        if ([v3 wantsCertifiedDelivery])
        {
          v13 = [v7 capabilities];
          BOOL v14 = (uint64_t)[v13 valueForCapability:v35] > 0;
        }
        else
        {
          BOOL v14 = 0;
        }
        v15 = objc_alloc_init(IDSPeerAggregatableMessage);
        v16 = [v7 pushTokenObject];
        [(IDSPeerAggregatableMessage *)v15 setTargetToken:v16];

        v17 = [v7 sessionToken];
        [(IDSPeerAggregatableMessage *)v15 setTargetSessionToken:v17];

        [(IDSPeerAggregatableMessage *)v15 setTargetPeerID:v8];
        v18 = +[NSNumber numberWithBool:v12];
        [(IDSPeerAggregatableMessage *)v15 setWantsDeliveryStatus:v18];

        [(IDSPeerAggregatableMessage *)v15 setWantsCertifiedDelivery:v14];
        v19 = [v7 anonymizedSenderID];
        [(IDSPeerAggregatableMessage *)v15 setAnonymizedSenderID:v19];

        v20 = [v7 expireDate];
        [(IDSPeerAggregatableMessage *)v15 setExpirationDate:v20];

        v21 = [v3 fromShortHandle];
        v22 = +[IDSPeerIDManager sharedInstance];
        v23 = [v3 fromID];
        v24 = +[IDSURI URIWithPrefixedURI:v23];
        v25 = [v22 shortHandleForURI:v8 fromURI:v24];

        if (v21 && v25)
        {
          [(IDSPeerAggregatableMessage *)v15 setSenderShortHandle:v21];
          [(IDSPeerAggregatableMessage *)v15 setTargetShortHandle:v25];
          id v26 = +[CUTUnsafePromise fulfilledPromiseWithValue:v15];
          [v38 addObject:v26];
        }
        else
        {
          id v26 = [objc_alloc((Class)NSError) initWithDomain:v34 code:40 userInfo:0];
          v27 = +[CUTUnsafePromise failedPromiseWithError:v26];
          [v38 addObject:v27];
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v5);
  }

  v28 = +[CUTUnsafePromise all:v38];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10004AF3C;
  v39[3] = &unk_10097FC80;
  id v40 = v3;
  id v41 = v33;
  id v29 = v33;
  id v30 = v3;
  v31 = [v28 then:v39];

  return v31;
}

@end