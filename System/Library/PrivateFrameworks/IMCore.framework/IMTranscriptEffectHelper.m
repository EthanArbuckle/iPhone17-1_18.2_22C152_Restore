@interface IMTranscriptEffectHelper
+ (BOOL)effectIdentifierIsFullScreenMoment:(id)a3;
+ (BOOL)effectIdentifierIsImpactEffect:(id)a3;
+ (BOOL)identifierIsEffectIdentifier:(id)a3;
+ (BOOL)isFeatureEnabled;
+ (BOOL)shouldShowReplayButtonForEffectIdentifier:(id)a3;
+ (id)allEffectIdentifiers;
+ (id)findIdentifierByMathcingPartialSufix:(id)a3;
+ (id)identifierNameMap;
+ (id)nameForEffectIdentifier:(id)a3;
+ (id)replayStringForEffectIdentifier:(id)a3;
+ (id)replayStringMap;
+ (id)sendWithEffectStringMap;
+ (id)sendWithStringForEffectIdentifier:(id)a3;
@end

@implementation IMTranscriptEffectHelper

+ (id)allEffectIdentifiers
{
  if (qword_1E965E930 != -1) {
    dispatch_once(&qword_1E965E930, &unk_1EF8E5478);
  }
  v2 = (void *)qword_1E965E928;

  return v2;
}

+ (BOOL)identifierIsEffectIdentifier:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_identifierNameMap(a1, v5, v6, v7);
  v11 = objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4, v10);

  return v11 != 0;
}

+ (BOOL)effectIdentifierIsFullScreenMoment:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_identifierIsEffectIdentifier_(a1, v5, (uint64_t)v4, v6))
  {
    objc_msgSend_rangeOfString_(v4, v7, @"com.apple.messages.effect", v8);
    BOOL v10 = v9 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)effectIdentifierIsImpactEffect:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_identifierIsEffectIdentifier_(a1, v5, (uint64_t)v4, v6))
  {
    objc_msgSend_rangeOfString_(v4, v7, @"com.apple.MobileSMS.expressivesend", v8);
    BOOL v10 = v9 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (id)identifierNameMap
{
  if (qword_1E965E940 != -1) {
    dispatch_once(&qword_1E965E940, &unk_1EF8E5BD8);
  }
  v2 = (void *)qword_1E965E938;

  return v2;
}

+ (id)replayStringMap
{
  if (qword_1E965E950 != -1) {
    dispatch_once(&qword_1E965E950, &unk_1EF8E5F98);
  }
  v2 = (void *)qword_1E965E948;

  return v2;
}

+ (id)sendWithEffectStringMap
{
  if (qword_1E965E960 != -1) {
    dispatch_once(&qword_1E965E960, &unk_1EF8E3BF0);
  }
  v2 = (void *)qword_1E965E958;

  return v2;
}

+ (id)findIdentifierByMathcingPartialSufix:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = objc_msgSend_allEffectIdentifiers(a1, v5, v6, v7, 0);
  id v12 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend_localizedCaseInsensitiveContainsString_(v15, v10, (uint64_t)v4, v11))
        {
          id v12 = v15;
          goto LABEL_11;
        }
      }
      id v12 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v17, (uint64_t)v21, 16);
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v12;
}

+ (id)nameForEffectIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_identifierNameMap(a1, v5, v6, v7);
  uint64_t v11 = objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

+ (id)replayStringForEffectIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_replayStringMap(a1, v5, v6, v7);
  uint64_t v11 = objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

+ (id)sendWithStringForEffectIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_sendWithEffectStringMap(a1, v5, v6, v7);
  uint64_t v11 = objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

+ (BOOL)isFeatureEnabled
{
  return 1;
}

+ (BOOL)shouldShowReplayButtonForEffectIdentifier:(id)a3
{
  id v3 = a3;
  int isFeatureEnabled = objc_msgSend_isFeatureEnabled(a1, v4, v5, v6);
  LOBYTE(a1) = 0;
  if (v3 && isFeatureEnabled) {
    LODWORD(a1) = objc_msgSend_isEqualToString_((void *)*MEMORY[0x1E4F6E470], v8, (uint64_t)v3, v9) ^ 1;
  }

  return (char)a1;
}

@end