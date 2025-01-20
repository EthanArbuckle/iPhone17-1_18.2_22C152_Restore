@interface _DPToolArguments
+ (id)usage;
- (BOOL)enforceMetadata;
- (BOOL)verbose;
- (BOOL)writeOK;
- (NSString)arguments;
- (NSString)command;
- (NSString)databasePath;
- (NSString)metadata;
- (NSString)recordKey;
- (_DPToolArguments)init;
- (_DPToolArguments)initWithDictionary:(id)a3;
- (id)description;
- (id)job;
@end

@implementation _DPToolArguments

- (_DPToolArguments)init
{
  v3 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  objc_msgSend(v3, "dp_addStringForKey:", kDPTCommandKey);
  objc_msgSend(v3, "dp_addStringForKey:", kDPTArgumentsCSVKey);
  objc_msgSend(v3, "dp_addStringForKey:", kDPTMetadataKey);
  objc_msgSend(v3, "dp_addStringForKey:", kDPTRecordKey);
  objc_msgSend(v3, "dp_addBoolForKey:", kDPTVerboseKey);
  objc_msgSend(v3, "dp_addStringForKey:", kDPTDataBaseDirectoryPath);
  objc_msgSend(v3, "dp_addBoolForKey:", kDPTWriteOKKey);
  objc_msgSend(v3, "dp_addBoolForKey:", kDPTEnforceMetadataKey);
  v4 = [(_DPToolArguments *)self initWithDictionary:v3];

  return v4;
}

- (_DPToolArguments)initWithDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_DPToolArguments;
  v5 = [(_DPToolArguments *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:kDPTCommandKey];
    command = v5->_command;
    v5->_command = (NSString *)v6;

    if (v5->_command)
    {
      uint64_t v8 = [v4 objectForKeyedSubscript:kDPTMetadataKey];
      metadata = v5->_metadata;
      v5->_metadata = (NSString *)v8;

      v10 = [v4 objectForKeyedSubscript:kDPTEnforceMetadataKey];
      v5->_enforceMetadata = [v10 BOOLValue];

      if (!v5->_enforceMetadata || v5->_metadata)
      {
        uint64_t v11 = [v4 objectForKeyedSubscript:kDPTRecordKey];
        recordKey = v5->_recordKey;
        v5->_recordKey = (NSString *)v11;

        if (!v5->_recordKey)
        {
          v5->_recordKey = (NSString *)@"com.apple.dprivacytool.TestKey";
        }
        uint64_t v13 = [v4 objectForKeyedSubscript:kDPTArgumentsCSVKey];
        arguments = v5->_arguments;
        v5->_arguments = (NSString *)v13;

        v15 = [v4 objectForKeyedSubscript:kDPTVerboseKey];
        v5->_verbose = v15 != 0;

        uint64_t v16 = [v4 objectForKeyedSubscript:kDPTDataBaseDirectoryPath];
        databasePath = v5->_databasePath;
        v5->_databasePath = (NSString *)v16;

        v18 = [v4 objectForKeyedSubscript:kDPTWriteOKKey];

        if (v18)
        {
          v19 = [v4 objectForKeyedSubscript:kDPTWriteOKKey];
          v5->_writeOK = [v19 BOOLValue];
        }
        else
        {
          v5->_writeOK = 0;
        }
        goto LABEL_10;
      }
      NSLog(&cfstr_IsSetToYesButI.isa, kDPTEnforceMetadataKey, kDPTMetadataKey, kDPTMetadataKey);
    }
    v20 = 0;
    goto LABEL_13;
  }
LABEL_10:
  v20 = v5;
LABEL_13:

  return v20;
}

- (id)job
{
  return +[_DPToolCommand command:self->_command arguments:self->_arguments metadata:self->_metadata recordKey:self->_recordKey databasePath:self->_databasePath writeOK:self->_writeOK];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  long long v10 = *(_OWORD *)&self->_command;
  recordKey = self->_recordKey;
  v7 = [NSNumber numberWithBool:self->_verbose];
  objc_msgSend(v3, "stringWithFormat:", @"%@: { command=%@ ; arguments=%@ ; recordKey=%@ ; verbose=%@ }",
    v5,
    v10,
    recordKey,
  uint64_t v8 = v7);

  return v8;
}

+ (id)usage
{
  v2 = [NSString stringWithFormat:@"Usage:\ndprivacytool -%@ <command> -%@ \"arguments to command\" [-%@ '\\{\"key1\":value,\"key2\":value \\}'] [-%@ \"keyName\"] [-%@ YES/NO] [[-%@ \"databasePathname\"] [-%@ YES/NO]], [-%@ YES/NO]\n", kDPTCommandKey, kDPTArgumentsCSVKey, kDPTMetadataKey, kDPTRecordKey, kDPTVerboseKey, kDPTDataBaseDirectoryPath, kDPTWriteOKKey, kDPTEnforceMetadataKey];
  v3 = NSString;
  id v4 = +[_DPToolCommand supportedCommands];
  v5 = [v3 stringWithFormat:@"Supported commands:\n%@\n", v4];

  uint64_t v6 = NSString;
  v7 = +[_DPToolCommand supportedMetadataKeys];
  uint64_t v8 = [v6 stringWithFormat:@"Supported metadata keys:\n%@\n", v7];

  v9 = [NSString stringWithFormat:@"Notes:\n[-%@ YES] is only applicable with [-%@ \"databasePathname\"]\n[-%@ YES] is only applicable for record commands\n", kDPTWriteOKKey, kDPTDataBaseDirectoryPath, kDPTEnforceMetadataKey];
  objc_msgSend(NSString, "stringWithFormat:", @"%@%@%@%@%@", v2, v5, v8, @"Example of arguments\n\trecordnumbers - \"1,2,3,4\"\n\trecordnumbersvectors - \"1,2,5;9,2\"\n\trecordbitvalues - \"12,21,37\"\n\trecordbitvectors - \"1101110001010101,1111100001101010001\"\n\trecordfloatvectors - \"1,2.5,-3.0; 3.14,2.2,5.9; -4.12,2.15,1.99\"\n\trecordstrings - \"string1,string2,string3\"\n\trecordwords - \"2:SecondWord,1:FirstWord,3:ThirdWord\"\n\tlistreports - \"all\" or \"pending\"\nExample of metadata (only JSON dictionary with escaped curly braces is supported)\n\tv1 - '\\{\"VersionHash\":\"v1\"\\}'\n\tv2 - '\\{\"VersionHash\":\"v2\",\n\t\t\"DediscoTaskConfig\":\\{\n\t\t\"Version\":\"0.1.0\",\n\t\t\"DediscoServerConfiguration\":\\{\n\t\t  \"Leader\":\"dap-leader-apple-01\",\n\t\t  \"Helpers\":[\"dap-helper-apple-01\"]\\},\n\t\t\"TaskExpiration\":4822500466,\n\t\t\"MinBatchSize\":2,\n\t\t\"MaxBatchSize\":1000\\}\\}'\n\n",
  long long v10 = v9);

  return v10;
}

- (NSString)command
{
  return self->_command;
}

- (NSString)arguments
{
  return self->_arguments;
}

- (NSString)metadata
{
  return self->_metadata;
}

- (NSString)recordKey
{
  return self->_recordKey;
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (BOOL)enforceMetadata
{
  return self->_enforceMetadata;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (BOOL)writeOK
{
  return self->_writeOK;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_recordKey, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_command, 0);
}

@end