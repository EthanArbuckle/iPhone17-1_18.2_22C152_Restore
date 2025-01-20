@interface INImage(_CDSpotlightRecorderAdditions)
- (id)cd_dataImage;
- (id)cd_encodedDataImage;
- (void)cd_dataImage;
- (void)cd_encodedDataImage;
@end

@implementation INImage(_CDSpotlightRecorderAdditions)

- (id)cd_dataImage
{
  if ([a1 _requiresRetrieval])
  {
    v2 = [a1 _uri];
    v3 = v2;
    if (v2 && ([v2 isFileURL] & 1) == 0)
    {
      v10 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18ECEB000, v10, OS_LOG_TYPE_DEFAULT, "Retrieving populated intent images with remote URLs is not supported", buf, 2u);
      }

      id v7 = 0;
    }
    else
    {
      slRESupergreenSuggestedImageDonationWidth();
      double v5 = v4;
      v6 = [MEMORY[0x1E4F304C8] sharedConnection];
      id v12 = 0;
      objc_msgSend(v6, "loadDataImageFromImage:scaledSize:error:", a1, &v12, v5, v5);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      id v8 = v12;

      if (!v7)
      {
        v9 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          [(INImage(_CDSpotlightRecorderAdditions) *)(uint64_t)v8 cd_dataImage];
        }
      }
    }
  }
  else
  {
    id v7 = a1;
  }
  return v7;
}

- (id)cd_encodedDataImage
{
  v1 = objc_msgSend(a1, "cd_dataImage");
  if (v1)
  {
    id v6 = 0;
    v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v1 requiringSecureCoding:1 error:&v6];
    id v3 = v6;
    if (!v2)
    {
      float v4 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        [(INImage(_CDSpotlightRecorderAdditions) *)(uint64_t)v3 cd_encodedDataImage];
      }
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)cd_dataImage
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Error retrieving populated intent image: %@", (uint8_t *)&v2, 0xCu);
}

- (void)cd_encodedDataImage
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Error archiving intents image: %@", (uint8_t *)&v2, 0xCu);
}

@end