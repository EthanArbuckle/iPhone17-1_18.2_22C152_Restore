@interface TUMetadataDestinationID(PhoneKit)
+ (id)metadataDestinationIDWithVoicemailMessage:()PhoneKit;
+ (id)metadataDestinationIDsForVMVoicemails:()PhoneKit;
@end

@implementation TUMetadataDestinationID(PhoneKit)

+ (id)metadataDestinationIDWithVoicemailMessage:()PhoneKit
{
  id v4 = a3;
  v5 = [v4 senderDestinationID];
  if ([v5 length])
  {
    v6 = [v4 senderISOCountryCode];
    v7 = +[TUHandle normalizedPhoneNumberHandleForValue:v5 isoCountryCode:v6];

    if (v7) {
      id v8 = [objc_alloc((Class)a1) initWithHandle:v7];
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)metadataDestinationIDsForVMVoicemails:()PhoneKit
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableOrderedSet);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v10 = [v9 receiverDestinationID];
        if ([v10 length])
        {
          v11 = [v9 receiverISOCountryCode];
          v12 = +[TUHandle normalizedPhoneNumberHandleForValue:v10 isoCountryCode:v11];

          if (v12) {
            id v13 = [objc_alloc((Class)TUMetadataDestinationID) initWithHandle:v12];
          }
          else {
            id v13 = 0;
          }
          [v4 addObject:v13];
        }
        else
        {
          id v13 = 0;
        }
        v14 = [v9 senderDestinationID];

        if ([v14 length])
        {
          v15 = [v9 senderISOCountryCode];
          v16 = +[TUHandle normalizedPhoneNumberHandleForValue:v14 isoCountryCode:v15];

          if (v16)
          {
            id v17 = [objc_alloc((Class)TUMetadataDestinationID) initWithHandle:v16];

            id v13 = v17;
          }
          [v4 addObject:v13];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  v18 = [v4 array];

  return v18;
}

@end