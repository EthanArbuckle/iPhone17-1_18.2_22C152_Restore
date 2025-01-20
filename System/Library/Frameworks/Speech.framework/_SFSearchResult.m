@interface _SFSearchResult
- (NSData)data;
- (NSHTTPURLResponse)response;
- (_SFSearchResult)initWithVoiceSearchResult:(id)a3;
- (id)description;
- (int64_t)searchType;
@end

@implementation _SFSearchResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_response, 0);
}

- (int64_t)searchType
{
  return self->_searchType;
}

- (NSData)data
{
  return self->_data;
}

- (NSHTTPURLResponse)response
{
  return self->_response;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:self->_data options:0 error:0];
  if (v3)
  {
    id v4 = [NSString alloc];
    v5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:1 error:0];
    v6 = (void *)[v4 initWithData:v5 encoding:4];

    if (v6)
    {
      v10.receiver = self;
      v10.super_class = (Class)_SFSearchResult;
      v7 = [(_SFSearchResult *)&v10 description];
      v8 = [v7 stringByAppendingString:v6];
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)_SFSearchResult;
      v8 = [(_SFSearchResult *)&v11 description];
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_SFSearchResult;
    v8 = [(_SFSearchResult *)&v12 description];
  }

  return v8;
}

- (_SFSearchResult)initWithVoiceSearchResult:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_SFSearchResult;
  v5 = [(_SFSearchResult *)&v21 init];
  if (v5)
  {
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v7 = [v4 statusCode];
    int v8 = [v7 intValue];
    CFHTTPMessageRef Response = CFHTTPMessageCreateResponse(v6, v8, &stru_1F10479F8, (CFStringRef)*MEMORY[0x1E4F18F90]);

    if (Response)
    {
      objc_super v10 = [v4 headers];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __45___SFSearchResult_initWithVoiceSearchResult___block_invoke;
      v20[3] = &__block_descriptor_40_e35_v32__0__NSString_8__NSString_16_B24l;
      v20[4] = Response;
      [v10 enumerateKeysAndObjectsUsingBlock:v20];

      uint64_t v11 = CFURLResponseCreateWithHTTPResponse();
      if (v11)
      {
        objc_super v12 = (const void *)v11;
        uint64_t v13 = [MEMORY[0x1E4F28D20] _responseWithCFURLResponse:v11];
        v14 = v5->_response;
        v5->_response = (NSHTTPURLResponse *)v13;

        CFRelease(v12);
      }
      CFRelease(Response);
    }
    uint64_t v15 = [v4 result];
    data = v5->_data;
    v5->_data = (NSData *)v15;

    v17 = [v4 searchType];
    if ([v17 isEqualToString:*MEMORY[0x1E4F97688]])
    {
      uint64_t v18 = 1;
    }
    else
    {
      if (![v17 isEqualToString:*MEMORY[0x1E4F97690]])
      {
LABEL_11:

        goto LABEL_12;
      }
      uint64_t v18 = 2;
    }
    v5->_searchType = v18;
    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

@end