@interface SAPhoneCallSnippet
- (id)sr_sirilandShim;
@end

@implementation SAPhoneCallSnippet

- (id)sr_sirilandShim
{
  v3 = [(SAPhoneCallSnippet *)self calls];
  v4 = v3;
  if (v3 && [v3 count])
  {
    v54 = v4;
    id v5 = objc_alloc_init((Class)SFCard);
    v6 = [(SAPhoneCallSnippet *)self title];
    [v5 setTitle:v6];

    [v5 setType:1];
    v7 = [(SAPhoneCallSnippet *)self aceId];
    [v5 setCardId:v7];

    [v5 setSource:2];
    id v8 = objc_alloc_init((Class)NSMutableArray);
    id v9 = objc_alloc_init((Class)NSMutableArray);
    v10 = [(SAPhoneCallSnippet *)self calls];
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_10006249C;
    v56[3] = &unk_1001445C8;
    id v11 = v8;
    id v57 = v11;
    id v55 = v9;
    id v58 = v55;
    v12 = [(SAPhoneCallSnippet *)self _callHistoryRowsForCalls:v10 callOperation:v56];

    v13 = [(SAPhoneCallSnippet *)self _searchCallHistoryIntentForVoicemail:0];
    v53 = v11;
    v14 = [(SAPhoneCallSnippet *)self _searchCallHistoryIntentResponseForCallRecords:v11];
    v15 = [v13 backingStore];
    uint64_t v16 = [v15 data];

    v17 = [(id)objc_opt_class() intentDescription];
    uint64_t v18 = [v17 name];

    [v5 setIntentMessageData:v16];
    v48 = (void *)v18;
    [v5 setIntentMessageName:v18];
    v50 = v14;
    v19 = [v14 backingStore];
    v20 = [v19 data];
    [v5 setIntentResponseMessageData:v20];

    v21 = [(id)objc_opt_class() intentDescription];
    v22 = [v21 responseName];
    [v5 setIntentResponseMessageName:v22];

    id v23 = objc_alloc_init((Class)SAIntentGroupLaunchAppWithIntent);
    v24 = +[NSUUID UUID];
    v25 = [v24 UUIDString];
    [v23 setAceId:v25];

    id v26 = objc_alloc_init((Class)SAIntentGroupProtobufMessage);
    v27 = +[NSUUID UUID];
    v28 = [v27 UUIDString];
    [v26 setAceId:v28];

    v49 = (void *)v16;
    [v26 setData:v16];
    v51 = v13;
    v29 = [(id)objc_opt_class() intentDescription];
    v30 = [v29 type];
    [v26 setTypeName:v30];

    [v23 setHandledIntent:v26];
    id v31 = objc_alloc_init((Class)SFAbstractCommand);
    [v31 setType:1];
    id v32 = objc_alloc_init((Class)SFCommandValue);
    id v33 = objc_alloc_init((Class)SFReferentialCommand);
    v34 = [v23 aceId];
    [v33 setReferenceIdentifier:v34];

    [v32 setReferentialCommand:v33];
    v47 = v31;
    [v31 setValue:v32];
    v52 = v12;
    id v35 = [v12 copy];
    [v5 setCardSections:v35];

    v36 = (SAPhoneCallSnippet *)objc_alloc_init((Class)SACardSnippet);
    id v37 = [objc_alloc((Class)_SFPBCard) initWithFacade:v5];
    v38 = [v37 data];
    [(SAPhoneCallSnippet *)v36 setCardData:v38];

    id v39 = [v55 copy];
    [(SAPhoneCallSnippet *)v36 setReferencedCommands:v39];

    id v40 = objc_alloc_init((Class)SAUISash);
    [v40 setApplicationBundleIdentifier:@"com.apple.mobilephone"];
    if (AFIsInternalInstall())
    {
      v41 = +[AFPreferences sharedPreferences];
      unsigned int v42 = [v41 debugButtonIsEnabled];

      if (v42)
      {
        v43 = sub_1000606C4(@"CALL_HISTORY_SASH_TITLE");
        v44 = +[NSString stringWithFormat:@"%@ (INTERNAL ONLY: LEGACY FLOW)", v43];
        [v40 setTitle:v44];
      }
    }
    id v59 = v23;
    v45 = +[NSArray arrayWithObjects:&v59 count:1];
    [v40 setCommands:v45];

    [(SAPhoneCallSnippet *)v36 setSash:v40];
    [(SAPhoneCallSnippet *)v36 sr_applySnippetProperties:self];

    v4 = v54;
  }
  else
  {
    v36 = self;
  }

  return v36;
}

@end