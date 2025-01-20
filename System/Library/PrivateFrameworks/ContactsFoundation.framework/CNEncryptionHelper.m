@interface CNEncryptionHelper
+ (id)decryptAddressingGrammarData:(id)a3;
+ (id)decryptAddressingGrammarString:(id)a3;
+ (id)encryptAddressingGrammar:(id)a3;
+ (id)encryptAddressingGrammarAsString:(id)a3;
+ (id)os_log;
@end

@implementation CNEncryptionHelper

+ (id)os_log
{
  if (os_log_cn_once_token_1_9 != -1) {
    dispatch_once(&os_log_cn_once_token_1_9, &__block_literal_global_50);
  }
  v2 = (void *)os_log_cn_once_object_1_9;

  return v2;
}

uint64_t __28__CNEncryptionHelper_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts", "encryption");
  uint64_t v1 = os_log_cn_once_object_1_9;
  os_log_cn_once_object_1_9 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)encryptAddressingGrammarAsString:(id)a3
{
  v3 = [a1 encryptAddressingGrammar:a3];
  v4 = [v3 base64EncodedStringWithOptions:0];

  return v4;
}

+ (id)decryptAddressingGrammarString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v4 options:0];
    if (v5)
    {
      v6 = [a1 decryptAddressingGrammarData:v5];
      goto LABEL_10;
    }
    v7 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[CNEncryptionHelper decryptAddressingGrammarString:]();
    }
  }
  else
  {
    v5 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[CNEncryptionHelper decryptAddressingGrammarString:]();
    }
  }
  v6 = 0;
LABEL_10:

  return v6;
}

+ (id)encryptAddressingGrammar:(id)a3
{
  if (a3)
  {
    v3 = [a3 dataRepresentation];
    id v4 = +[CNDataEncryptor encryptData:v3 keyLabel:@"com.apple.contacts.keys.pronouns"];

    if (v4)
    {
      id v5 = v4;
    }
    else
    {
      v6 = objc_msgSend((id)objc_opt_class(), "os_log");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        +[CNEncryptionHelper encryptAddressingGrammar:]();
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)decryptAddressingGrammarData:(id)a3
{
  if (a3)
  {
    v3 = +[CNDataEncryptor decryptData:a3 keyLabel:@"com.apple.contacts.keys.pronouns"];
    if (v3)
    {
      id v4 = [MEMORY[0x1E4F29040] termOfAddressFromDataRepresentation:v3];
    }
    else
    {
      id v5 = objc_msgSend((id)objc_opt_class(), "os_log");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[CNEncryptionHelper decryptAddressingGrammarData:]();
      }

      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (void)decryptAddressingGrammarString:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19091D000, v0, v1, "Failed to decrypt pronoun, empty string supplied", v2, v3, v4, v5, v6);
}

+ (void)decryptAddressingGrammarString:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19091D000, v0, v1, "Failed to decrypt pronoun, invalid base64 string supplied", v2, v3, v4, v5, v6);
}

+ (void)encryptAddressingGrammar:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19091D000, v0, v1, "Failed to encrypt pronoun", v2, v3, v4, v5, v6);
}

+ (void)decryptAddressingGrammarData:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_19091D000, v0, v1, "Failed to decrypt data for pronoun", v2, v3, v4, v5, v6);
}

@end