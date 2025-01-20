@interface EMListUnsubscribeMessageGenerator
+ (id)dateString;
+ (id)localizedBodyForCommand:(id)a3;
+ (id)messageHeadersWithCommand:(id)a3 headersFactory:(id)a4;
+ (id)senderForCommand:(id)a3;
@end

@implementation EMListUnsubscribeMessageGenerator

+ (id)messageHeadersWithCommand:(id)a3 headersFactory:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"EMListUnsubscribeMessageGenerator.m", 15, @"Invalid parameter not satisfying: %@", @"command" object file lineNumber description];
  }
  v9 = [v8 mutableMessageHeaders];
  [v9 setHeader:@"auto-replied" forKey:*MEMORY[0x1E4F60648]];
  [v9 setHeader:@"true" forKey:*MEMORY[0x1E4F60758]];
  v10 = [v7 mailtoValues];
  if (!v10)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:a1 file:@"EMListUnsubscribeMessageGenerator.m" lineNumber:26 description:@"Mailto value are missing"];
  }
  uint64_t v11 = [v10 subject];
  v12 = (void *)v11;
  if (v11) {
    v13 = (__CFString *)v11;
  }
  else {
    v13 = &stru_1F1A3DFB0;
  }
  [v9 setHeader:v13 forKey:*MEMORY[0x1E4F60738]];

  v14 = [v10 address];
  v23[0] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  [v9 setAddressListForTo:v15];

  v16 = [a1 senderForCommand:v7];
  v22 = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  [v9 setAddressListForSender:v17];

  v18 = [a1 dateString];
  [v9 setHeader:v18 forKey:*MEMORY[0x1E4F606A0]];

  return v9;
}

+ (id)localizedBodyForCommand:(id)a3
{
  id v3 = a3;
  v4 = NSString;
  v5 = _EFLocalizedString();
  v6 = [v3 mailtoValues];
  id v7 = [v6 subject];
  id v8 = objc_msgSend(v4, "stringWithFormat:", v5, v7);

  return v8;
}

+ (id)senderForCommand:(id)a3
{
  id v5 = a3;
  [a1 doesNotRecognizeSelector:a2];
  __assert_rtn("+[EMListUnsubscribeMessageGenerator senderForCommand:]", "EMListUnsubscribeMessageGenerator.m", 43, "0");
}

+ (id)dateString
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  id v3 = objc_msgSend(v2, "ec_descriptionForMimeHeaders");

  return v3;
}

@end