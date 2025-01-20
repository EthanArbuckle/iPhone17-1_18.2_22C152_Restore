@interface NSString(ProtoUtils)
- (id)_intents_allowedUnarchiverClassesForProtoAsClasses;
- (id)_intents_allowedUnarchiverClassesForProtoAsStrings;
- (id)_intents_decodeFromProto;
- (id)_intents_encodeForProto;
@end

@implementation NSString(ProtoUtils)

- (id)_intents_decodeFromProto
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (_INSharedClassPrefixRegularExpression_onceToken != -1) {
    dispatch_once(&_INSharedClassPrefixRegularExpression_onceToken, &__block_literal_global_35);
  }
  id v2 = (id)_INSharedClassPrefixRegularExpression_regularExpression;
  v3 = objc_msgSend(v2, "firstMatchInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));

  if (v3 && (uint64_t v4 = [v3 rangeAtIndex:1], v4 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v7 = objc_msgSend(a1, "substringWithRange:", v4, v5);
    [v3 range];
    v9 = [a1 substringFromIndex:v8];
    if ([v9 length])
    {
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v9 options:0];
      if (v10)
      {
        v11 = objc_msgSend(a1, "_intents_allowedUnarchiverClassesForProtoAsStrings");
        v12 = objc_msgSend(a1, "_intents_allowedUnarchiverClassesForProtoAsClasses");
        if (v12 && v11)
        {
          if (([v11 containsObject:v7] & 1) == 0)
          {
            v13 = INSiriLogContextIntents;
            if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v21 = "-[NSString(ProtoUtils) _intents_decodeFromProto]";
              __int16 v22 = 2112;
              id v23 = v7;
              __int16 v24 = 2112;
              v25 = v12;
              _os_log_error_impl(&dword_18CB2F000, v13, OS_LOG_TYPE_ERROR, "%s Proto references class %@ which is not an allowed class (%@)", buf, 0x20u);
            }
          }
          id v19 = 0;
          id v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v12 fromData:v10 error:&v19];
          id v14 = v19;
          if (v6)
          {
            id v15 = v6;
          }
          else
          {
            v17 = INSiriLogContextIntents;
            if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v21 = "-[NSString(ProtoUtils) _intents_decodeFromProto]";
              __int16 v22 = 2112;
              id v23 = v14;
              _os_log_error_impl(&dword_18CB2F000, v17, OS_LOG_TYPE_ERROR, "%s Failed to decode string for proto: %@", buf, 0x16u);
            }
          }
        }
        else
        {
          v16 = INSiriLogContextIntents;
          if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v21 = "-[NSString(ProtoUtils) _intents_decodeFromProto]";
            _os_log_error_impl(&dword_18CB2F000, v16, OS_LOG_TYPE_ERROR, "%s Failed to find allowed classes for proto", buf, 0xCu);
          }
          id v6 = 0;
        }
      }
      else
      {
        id v6 = a1;
      }
    }
    else
    {
      id v6 = a1;
    }
  }
  else
  {
    id v6 = a1;
  }

  return v6;
}

- (id)_intents_encodeForProto
{
  v1 = (void *)[a1 copy];

  return v1;
}

- (id)_intents_allowedUnarchiverClassesForProtoAsStrings
{
  if (_intents_allowedUnarchiverClassesForProtoAsStrings_onceToken != -1) {
    dispatch_once(&_intents_allowedUnarchiverClassesForProtoAsStrings_onceToken, &__block_literal_global_5_94062);
  }
  v0 = (void *)_intents_allowedUnarchiverClassesForProtoAsStrings___classesAsStrings;

  return v0;
}

- (id)_intents_allowedUnarchiverClassesForProtoAsClasses
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__NSString_ProtoUtils___intents_allowedUnarchiverClassesForProtoAsClasses__block_invoke;
  block[3] = &unk_1E55208F8;
  block[4] = a1;
  if (_intents_allowedUnarchiverClassesForProtoAsClasses_onceToken != -1) {
    dispatch_once(&_intents_allowedUnarchiverClassesForProtoAsClasses_onceToken, block);
  }
  return (id)_intents_allowedUnarchiverClassesForProtoAsClasses___allowedClasses;
}

@end