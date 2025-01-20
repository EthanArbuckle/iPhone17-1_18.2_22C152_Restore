@interface _SFAnalysisContextCodingObject
+ (BOOL)supportsSecureCoding;
- (NSArray)contextualNamedEntities;
- (NSArray)contextualStrings;
- (NSArray)leftContext;
- (NSArray)rightContext;
- (NSArray)selectedText;
- (NSData)jitProfileData;
- (NSData)profileData;
- (NSString)geoLMRegionID;
- (_SFAnalysisContextCodingObject)initWithCoder:(id)a3;
- (_SFAnalysisContextCodingObject)initWithLeftContext:(id)a3 rightContext:(id)a4 selectedText:(id)a5 geoLMRegionID:(id)a6 contextualStrings:(id)a7 contextualNamedEntities:(id)a8 profileData:(id)a9 jitProfileData:(id)a10;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SFAnalysisContextCodingObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jitProfileData, 0);
  objc_storeStrong((id *)&self->_profileData, 0);
  objc_storeStrong((id *)&self->_contextualNamedEntities, 0);
  objc_storeStrong((id *)&self->_contextualStrings, 0);
  objc_storeStrong((id *)&self->_geoLMRegionID, 0);
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_rightContext, 0);

  objc_storeStrong((id *)&self->_leftContext, 0);
}

- (NSData)jitProfileData
{
  return self->_jitProfileData;
}

- (NSData)profileData
{
  return self->_profileData;
}

- (NSArray)contextualNamedEntities
{
  return self->_contextualNamedEntities;
}

- (NSArray)contextualStrings
{
  return self->_contextualStrings;
}

- (NSString)geoLMRegionID
{
  return self->_geoLMRegionID;
}

- (NSArray)selectedText
{
  return self->_selectedText;
}

- (NSArray)rightContext
{
  return self->_rightContext;
}

- (NSArray)leftContext
{
  return self->_leftContext;
}

- (_SFAnalysisContextCodingObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_SFAnalysisContextCodingObject;
  v5 = [(_SFAnalysisContextCodingObject *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_leftContext"];
    leftContext = v5->_leftContext;
    v5->_leftContext = (NSArray *)v6;

    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_rightContext"];
    rightContext = v5->_rightContext;
    v5->_rightContext = (NSArray *)v8;

    uint64_t v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_selectedText"];
    selectedText = v5->_selectedText;
    v5->_selectedText = (NSArray *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_geoLMRegionID"];
    geoLMRegionID = v5->_geoLMRegionID;
    v5->_geoLMRegionID = (NSString *)v12;

    uint64_t v14 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_contextualStrings"];
    contextualStrings = v5->_contextualStrings;
    v5->_contextualStrings = (NSArray *)v14;

    uint64_t v16 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_contextualNamedEntities"];
    contextualNamedEntities = v5->_contextualNamedEntities;
    v5->_contextualNamedEntities = (NSArray *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_profileData"];
    profileData = v5->_profileData;
    v5->_profileData = (NSData *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_jitProfileData"];
    jitProfileData = v5->_jitProfileData;
    v5->_jitProfileData = (NSData *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  leftContext = self->_leftContext;
  id v5 = a3;
  [v5 encodeObject:leftContext forKey:@"_leftContext"];
  [v5 encodeObject:self->_rightContext forKey:@"_rightContext"];
  [v5 encodeObject:self->_selectedText forKey:@"_selectedText"];
  [v5 encodeObject:self->_geoLMRegionID forKey:@"_geoLMRegionID"];
  [v5 encodeObject:self->_contextualStrings forKey:@"_contextualStrings"];
  [v5 encodeObject:self->_contextualNamedEntities forKey:@"_contextualNamedEntities"];
  [v5 encodeObject:self->_profileData forKey:@"_profileData"];
  [v5 encodeObject:self->_jitProfileData forKey:@"_jitProfileData"];
}

- (_SFAnalysisContextCodingObject)initWithLeftContext:(id)a3 rightContext:(id)a4 selectedText:(id)a5 geoLMRegionID:(id)a6 contextualStrings:(id)a7 contextualNamedEntities:(id)a8 profileData:(id)a9 jitProfileData:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v42.receiver = self;
  v42.super_class = (Class)_SFAnalysisContextCodingObject;
  v24 = [(_SFAnalysisContextCodingObject *)&v42 init];
  if (v24)
  {
    uint64_t v25 = [v16 copy];
    leftContext = v24->_leftContext;
    v24->_leftContext = (NSArray *)v25;

    uint64_t v27 = [v17 copy];
    rightContext = v24->_rightContext;
    v24->_rightContext = (NSArray *)v27;

    uint64_t v29 = [v18 copy];
    selectedText = v24->_selectedText;
    v24->_selectedText = (NSArray *)v29;

    uint64_t v31 = [v19 copy];
    geoLMRegionID = v24->_geoLMRegionID;
    v24->_geoLMRegionID = (NSString *)v31;

    uint64_t v33 = [v20 copy];
    contextualStrings = v24->_contextualStrings;
    v24->_contextualStrings = (NSArray *)v33;

    uint64_t v35 = [v21 copy];
    contextualNamedEntities = v24->_contextualNamedEntities;
    v24->_contextualNamedEntities = (NSArray *)v35;

    uint64_t v37 = [v22 copy];
    profileData = v24->_profileData;
    v24->_profileData = (NSData *)v37;

    uint64_t v39 = [v23 copy];
    jitProfileData = v24->_jitProfileData;
    v24->_jitProfileData = (NSData *)v39;
  }
  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end