@interface IMCoreRecentsMetadataBuilder
+ (id)deprecatedReferenceURLForMessageGUID:(id)a3;
+ (id)metadataDictionaryForMessageID:(id)a3 senderID:(id)a4 date:(id)a5;
+ (id)referenceURLForMessageGUID:(id)a3;
@end

@implementation IMCoreRecentsMetadataBuilder

+ (id)referenceURLForMessageGUID:(id)a3
{
  return (id)[NSString stringWithFormat:@"sms://open?message-guid=%@", a3];
}

+ (id)deprecatedReferenceURLForMessageGUID:(id)a3
{
  return (id)[NSString stringWithFormat:@"sms:/open?message-guid=%@", a3];
}

+ (id)metadataDictionaryForMessageID:(id)a3 senderID:(id)a4 date:(id)a5
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (__CFString *)a4;
  id v10 = a5;
  if (!qword_1E94FF588)
  {
    v11 = (void **)MEMORY[0x1A6227920]("CRAddressKindEmail", @"CoreRecents");
    if (v11) {
      v12 = *v11;
    }
    else {
      v12 = 0;
    }
    objc_storeStrong((id *)&qword_1E94FF588, v12);
  }
  if (!qword_1E94FF590)
  {
    v13 = (void **)MEMORY[0x1A6227920]("CRAddressKindPhoneNumber", @"CoreRecents");
    if (v13) {
      v14 = *v13;
    }
    else {
      v14 = 0;
    }
    objc_storeStrong((id *)&qword_1E94FF590, v14);
  }
  if (!qword_1E94FF598)
  {
    v15 = (void **)MEMORY[0x1A6227920]("CRRecentContactMetadataEventTime", @"CoreRecents");
    if (v15) {
      v16 = *v15;
    }
    else {
      v16 = 0;
    }
    objc_storeStrong((id *)&qword_1E94FF598, v16);
  }
  if (!qword_1E94FF5A0)
  {
    v17 = (void **)MEMORY[0x1A6227920]("CRRecentContactMetadataReferenceURL", @"CoreRecents");
    if (v17) {
      v18 = *v17;
    }
    else {
      v18 = 0;
    }
    objc_storeStrong((id *)&qword_1E94FF5A0, v18);
  }
  if (!qword_1E94FF5A8)
  {
    v19 = (void **)MEMORY[0x1A6227920]("CRRecentContactMetadataFromAddress", @"CoreRecents");
    if (v19) {
      v20 = *v19;
    }
    else {
      v20 = 0;
    }
    objc_storeStrong((id *)&qword_1E94FF5A8, v20);
  }
  if (!qword_1E94FF5B0)
  {
    v21 = (void **)MEMORY[0x1A6227920]("CRRecentContactMetadataFromAddressKind", @"CoreRecents");
    if (v21) {
      v22 = *v21;
    }
    else {
      v22 = 0;
    }
    objc_storeStrong((id *)&qword_1E94FF5B0, v22);
  }
  if (!qword_1E94FF5B8)
  {
    v23 = (void **)MEMORY[0x1A6227920]("CRRecentContactMetadataFrom", @"CoreRecents");
    if (v23) {
      v24 = *v23;
    }
    else {
      v24 = 0;
    }
    objc_storeStrong((id *)&qword_1E94FF5B8, v24);
  }
  if (v9)
  {
    if (v10) {
      goto LABEL_49;
    }
    goto LABEL_44;
  }
  if (IMOSLoggingEnabled())
  {
    v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v37 = 0;
    }
  }
  v9 = &stru_1EF2CAD28;
  if (!v10)
  {
LABEL_44:
    if (IMOSLoggingEnabled())
    {
      v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v37 = 0;
      }
    }
    id v10 = [MEMORY[0x1E4F1C9C8] now];
  }
LABEL_49:
  int v27 = [(__CFString *)v9 _appearsToBePhoneNumber];
  IMNormalizeFormattedString();
  v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v29 = &qword_1E94FF590;
  if (!v27) {
    v29 = &qword_1E94FF588;
  }
  v30 = (__CFString *)(id)*v29;
  v31 = [a1 referenceURLForMessageGUID:v8];
  if (v28)
  {
    if (v30) {
      goto LABEL_64;
    }
    goto LABEL_59;
  }
  if (IMOSLoggingEnabled())
  {
    v32 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v37 = 0;
    }
  }
  v28 = &stru_1EF2CAD28;
  if (!v30)
  {
LABEL_59:
    if (IMOSLoggingEnabled())
    {
      v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v37 = 0;
      }
    }
    v30 = &stru_1EF2CAD28;
  }
LABEL_64:
  v40[0] = qword_1E94FF5A8;
  v40[1] = qword_1E94FF5B0;
  v41[0] = v28;
  v41[1] = v30;
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
  v38[0] = qword_1E94FF598;
  v38[1] = qword_1E94FF5B8;
  v39[0] = v10;
  v39[1] = v34;
  v38[2] = qword_1E94FF5A0;
  v38[3] = @"messages:message-guid";
  v39[2] = v31;
  v39[3] = v8;
  v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:4];

  return v35;
}

@end