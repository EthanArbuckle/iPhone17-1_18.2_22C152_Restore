@interface CHSScreenshotPresentationAttributes
- (BOOL)allowsPrivacySensitiveContent;
- (BOOL)isEqual:(id)a3;
- (BOOL)userWantsWidgetDataWhenPasscodeLocked;
- (CHSWidgetTintParameters)tintParameters;
- (NSString)additionalSettingsContext;
- (int64_t)colorScheme;
- (unint64_t)hash;
@end

@implementation CHSScreenshotPresentationAttributes

- (unint64_t)hash
{
  int64_t v3 = self->_colorScheme + self->_allowsPrivacySensitiveContent + self->_userWantsWidgetDataWhenPasscodeLocked + 19;
  NSUInteger v4 = [(NSString *)self->_additionalSettingsContext hash];
  return v3 ^ v4 ^ [(CHSWidgetTintParameters *)self->_tintParameters hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v9 = [MEMORY[0x1E4F4F738] builderWithObject:self ofExpectedClass:objc_opt_class()];
    int64_t colorScheme = self->_colorScheme;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __47__CHSScreenshotPresentationAttributes_isEqual___block_invoke;
    v34[3] = &unk_1E56C8530;
    id v11 = v8;
    id v35 = v11;
    id v12 = (id)[v9 appendInteger:colorScheme counterpart:v34];
    BOOL allowsPrivacySensitiveContent = self->_allowsPrivacySensitiveContent;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __47__CHSScreenshotPresentationAttributes_isEqual___block_invoke_2;
    v32[3] = &unk_1E56C8468;
    id v14 = v11;
    id v33 = v14;
    id v15 = (id)[v9 appendBool:allowsPrivacySensitiveContent counterpart:v32];
    BOOL userWantsWidgetDataWhenPasscodeLocked = self->_userWantsWidgetDataWhenPasscodeLocked;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __47__CHSScreenshotPresentationAttributes_isEqual___block_invoke_3;
    v30[3] = &unk_1E56C8468;
    id v17 = v14;
    id v31 = v17;
    id v18 = (id)[v9 appendBool:userWantsWidgetDataWhenPasscodeLocked counterpart:v30];
    additionalSettingsContext = self->_additionalSettingsContext;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __47__CHSScreenshotPresentationAttributes_isEqual___block_invoke_4;
    v28[3] = &unk_1E56C8508;
    id v20 = v17;
    id v29 = v20;
    id v21 = (id)[v9 appendString:additionalSettingsContext counterpart:v28];
    tintParameters = self->_tintParameters;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __47__CHSScreenshotPresentationAttributes_isEqual___block_invoke_5;
    v26[3] = &unk_1E56C89A0;
    id v27 = v20;
    id v23 = (id)[v9 appendObject:tintParameters counterpart:v26];
    char v24 = [v9 isEqual];
  }
  else
  {
    char v24 = 0;
  }

  return v24;
}

uint64_t __47__CHSScreenshotPresentationAttributes_isEqual___block_invoke(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 8);
}

uint64_t __47__CHSScreenshotPresentationAttributes_isEqual___block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 16);
}

uint64_t __47__CHSScreenshotPresentationAttributes_isEqual___block_invoke_3(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 17);
}

id __47__CHSScreenshotPresentationAttributes_isEqual___block_invoke_4(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

id __47__CHSScreenshotPresentationAttributes_isEqual___block_invoke_5(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 32);
}

- (int64_t)colorScheme
{
  return self->_colorScheme;
}

- (BOOL)allowsPrivacySensitiveContent
{
  return self->_allowsPrivacySensitiveContent;
}

- (BOOL)userWantsWidgetDataWhenPasscodeLocked
{
  return self->_userWantsWidgetDataWhenPasscodeLocked;
}

- (CHSWidgetTintParameters)tintParameters
{
  return self->_tintParameters;
}

- (NSString)additionalSettingsContext
{
  return self->_additionalSettingsContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintParameters, 0);
  objc_storeStrong((id *)&self->_additionalSettingsContext, 0);
}

@end