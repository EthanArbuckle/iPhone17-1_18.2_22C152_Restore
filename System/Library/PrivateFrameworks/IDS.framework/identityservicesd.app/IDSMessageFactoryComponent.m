@interface IDSMessageFactoryComponent
- (BOOL)shouldSendAsAttachment:(id)a3 maxSize:(unint64_t)a4;
- (IDSMessageFactoryComponent)initWithMMCSUploader:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IDSMessageFactoryComponent

- (IDSMessageFactoryComponent)initWithMMCSUploader:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSMessageFactoryComponent;
  v6 = [(IDSMessageFactoryComponent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mmcsUploader, a3);
  }

  return v7;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v3 = a3;
  v51 = [v3 guid];
  v4 = [v3 endpointsToEncryptedData];
  [v3 setUsedMMCS:0];
  id v49 = objc_alloc_init((Class)NSMutableArray);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v5 = v4;
  id v50 = [v5 countByEnumeratingWithState:&v66 objects:v74 count:16];
  if (v50)
  {
    uint64_t v48 = *(void *)v67;
    uint64_t v46 = IDSRegistrationPropertySupportsCertifiedDeliveryV1;
    *(void *)&long long v6 = 138412546;
    long long v45 = v6;
    id v47 = v5;
    do
    {
      for (i = 0; i != v50; i = (char *)i + 1)
      {
        if (*(void *)v67 != v48) {
          objc_enumerationMutation(v5);
        }
        v8 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        objc_super v9 = objc_msgSend(v8, "URI", v45);
        v10 = [v3 fromID];
        v54 = v9;
        v11 = [v9 prefixedURI];
        unsigned __int8 v12 = [v10 isEqualToString:v11];

        if (v12) {
          id v13 = 0;
        }
        else {
          id v13 = [v3 wantsDeliveryStatus];
        }
        if ([v3 wantsCertifiedDelivery])
        {
          v14 = [v8 capabilities];
          BOOL v15 = (uint64_t)[v14 valueForCapability:v46] > 0;
        }
        else
        {
          BOOL v15 = 0;
        }
        v16 = [v5 objectForKey:v8];
        if (([v3 forceAttachmentMessage] & 1) != 0
          || -[IDSMessageFactoryComponent shouldSendAsAttachment:maxSize:](self, "shouldSendAsAttachment:maxSize:", v16, [v3 maxSize]))
        {
          BOOL v53 = v15;
          char v17 = (char)v13;
          v18 = +[IDSFoundationLog delivery];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = [v8 pushTokenObject];
            v20 = [v54 URIByAddingPushToken:v19];
            *(_DWORD *)buf = v45;
            v71 = v51;
            __int16 v72 = 2112;
            v73 = v20;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "GUID %@ Uploading data as attachment for token: %@", buf, 0x16u);
          }
          [v3 setUsedMMCS:1];
          id v21 = objc_alloc_init((Class)CUTUnsafePromiseSeal);
          mmcsUploader = self->_mmcsUploader;
          v23 = [v3 fromID];
          v24 = [v3 service];
          -[IDSMMCSUploader uploadData:fromID:toEndpoint:onTopic:forGUID:encryptionType:](mmcsUploader, "uploadData:fromID:toEndpoint:onTopic:forGUID:encryptionType:", v16, v23, v8, v24, v51, [v3 encryptionType]);
          v25 = (IDSPeerAggregatableMessage *)objc_claimAutoreleasedReturnValue();

          v58[0] = _NSConcreteStackBlock;
          v58[1] = 3221225472;
          v58[2] = sub_10013E4D4;
          v58[3] = &unk_1009836C0;
          id v59 = v3;
          id v60 = v21;
          v61 = v8;
          v26 = v54;
          id v62 = v54;
          char v64 = v17;
          BOOL v65 = v53;
          id v63 = v51;
          id v27 = v21;
          [(IDSPeerAggregatableMessage *)v25 registerResultBlock:v58];
          v28 = [v27 promise];
          [v49 addObject:v28];

          id v5 = v47;
        }
        else
        {
          v25 = objc_alloc_init(IDSPeerAggregatableMessage);
          v29 = [v8 pushTokenObject];
          [(IDSPeerAggregatableMessage *)v25 setTargetToken:v29];

          v30 = [v8 sessionToken];
          [(IDSPeerAggregatableMessage *)v25 setTargetSessionToken:v30];

          [(IDSPeerAggregatableMessage *)v25 setTargetPeerID:v54];
          v31 = [v16 data];
          [(IDSPeerAggregatableMessage *)v25 setEncryptedData:v31];

          v32 = +[NSNumber numberWithBool:v13];
          [(IDSPeerAggregatableMessage *)v25 setWantsDeliveryStatus:v32];

          [(IDSPeerAggregatableMessage *)v25 setWantsCertifiedDelivery:v15];
          v33 = [v16 payloadMetadata];
          id v34 = [v33 length];

          if (v34)
          {
            v35 = [v16 payloadMetadata];
            [(IDSPeerAggregatableMessage *)v25 setPayloadMetadata:v35];
          }
          v36 = [v8 anonymizedSenderID];
          [(IDSPeerAggregatableMessage *)v25 setAnonymizedSenderID:v36];

          v37 = [v8 expireDate];
          [(IDSPeerAggregatableMessage *)v25 setExpirationDate:v37];

          if ([v16 encryptionType] != (id)2)
          {
            [v16 encryptionType];
            v38 = IDSEncryptionTypeStringFromEncryptionType();
            [(IDSPeerAggregatableMessage *)v25 setEncryptionType:v38];
          }
          id v27 = +[CUTUnsafePromise fulfilledPromiseWithValue:v25];
          [v49 addObject:v27];
          v26 = v54;
        }
      }
      id v50 = [v5 countByEnumeratingWithState:&v66 objects:v74 count:16];
    }
    while (v50);
  }

  v39 = +[CUTUnsafePromise all:v49];
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_10013E918;
  v55[3] = &unk_10097FC80;
  id v56 = v3;
  id v57 = v51;
  v40 = v5;
  id v41 = v51;
  id v42 = v3;
  v43 = [v39 then:v55];

  return v43;
}

- (BOOL)shouldSendAsAttachment:(id)a3 maxSize:(unint64_t)a4
{
  id v5 = [a3 data];
  LOBYTE(a4) = (unint64_t)[v5 length] >= a4;

  return a4;
}

- (void).cxx_destruct
{
}

@end