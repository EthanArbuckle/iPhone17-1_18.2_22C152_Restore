@interface CKContextResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExactMatch;
- (BOOL)isOnScreen;
- (CGPoint)absoluteOriginOnScreen;
- (CGRect)frameInWindow;
- (CKContextResult)initWithCoder:(id)a3;
- (CKContextResult)initWithTitle:(id)a3 query:(id)a4 url:(id)a5 category:(id)a6;
- (NSArray)associatedResults;
- (NSDateComponents)extractedEndDateComponents;
- (NSDateComponents)extractedStartDateComponents;
- (NSDictionary)extractedAddressComponents;
- (NSOrderedSet)relatedItems;
- (NSSet)tags;
- (NSString)category;
- (NSString)debug;
- (NSString)query;
- (NSString)sceneIdentifier;
- (NSString)title;
- (NSString)topicId;
- (NSURL)url;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)toJSONSerializableDictionary;
- (int64_t)minPrefix;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAbsoluteOriginOnScreen:(CGPoint)a3;
- (void)setAssociatedResults:(id)a3;
- (void)setCategory:(id)a3;
- (void)setDebug:(id)a3;
- (void)setExactMatch:(BOOL)a3;
- (void)setExtractedAddressComponents:(id)a3;
- (void)setExtractedEndDateComponents:(id)a3;
- (void)setExtractedStartDateComponents:(id)a3;
- (void)setFrameInWindow:(CGRect)a3;
- (void)setMinPrefix:(int64_t)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)setQuery:(id)a3;
- (void)setRelatedItems:(id)a3;
- (void)setSceneIdentifier:(id)a3;
- (void)setTags:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTopicId:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation CKContextResult

- (NSString)topicId
{
  return self->_topicId;
}

- (void)setRelatedItems:(id)a3
{
}

- (NSOrderedSet)relatedItems
{
  return self->_relatedItems;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_query forKey:@"query"];
  [v5 encodeObject:self->_url forKey:@"url"];
  [v5 encodeObject:self->_topicId forKey:@"topicId"];
  [v5 encodeObject:self->_category forKey:@"category"];
  [v5 encodeObject:self->_debug forKey:@"debug"];
  [v5 encodeObject:self->_relatedItems forKey:@"relatedItems"];
  [v5 encodeObject:self->_associatedResults forKey:@"associatedResults"];
  [v5 encodeObject:self->_tags forKey:@"tags"];
  [v5 encodeInteger:self->_minPrefix forKey:@"minPrefix"];
  [v5 encodeBool:self->_exactMatch forKey:@"exactMatch"];
  [v5 encodeObject:self->_extractedStartDateComponents forKey:@"extractedStartDateComponents"];
  [v5 encodeObject:self->_extractedEndDateComponents forKey:@"extractedEndDateComponents"];
  [v5 encodeObject:self->_extractedAddressComponents forKey:@"extractedAddressComponents"];
  [v5 encodeBool:self->_onScreen forKey:@"onScreen"];
  [v5 encodeObject:self->_sceneIdentifier forKey:@"sceneIdentifier"];
  [v5 encodeDouble:@"frameInWindow.x" forKey:self->_frameInWindow.origin.x];
  [v5 encodeDouble:@"frameInWindow.y" forKey:self->_frameInWindow.origin.y];
  [v5 encodeDouble:@"frameInWindow.width" forKey:self->_frameInWindow.size.width];
  [v5 encodeDouble:@"frameInWindow.height" forKey:self->_frameInWindow.size.height];
  [v5 encodeDouble:@"absoluteOrigin.x" forKey:self->_absoluteOriginOnScreen.x];
  [v5 encodeDouble:@"absoluteOrigin.y" forKey:self->_absoluteOriginOnScreen.y];
}

- (CKContextResult)initWithTitle:(id)a3 query:(id)a4 url:(id)a5 category:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CKContextResult;
  v14 = [(CKContextResult *)&v22 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    title = v14->_title;
    v14->_title = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    query = v14->_query;
    v14->_query = (NSString *)v17;

    if (v12)
    {
      uint64_t v19 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
      url = v14->_url;
      v14->_url = (NSURL *)v19;
    }
    else
    {
      url = v14->_url;
      v14->_url = 0;
    }

    objc_storeStrong((id *)&v14->_category, a6);
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedResults, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_extractedAddressComponents, 0);
  objc_storeStrong((id *)&self->_extractedEndDateComponents, 0);
  objc_storeStrong((id *)&self->_extractedStartDateComponents, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_relatedItems, 0);
  objc_storeStrong((id *)&self->_debug, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_topicId, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (CKContextResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)CKContextResult;
  id v5 = [(CKContextResult *)&v56 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = v6;
    v8 = v6;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"query"];
    query = v5->_query;
    v5->_query = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"topicId"];
    topicId = v5->_topicId;
    v5->_topicId = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"category"];
    category = v5->_category;
    v5->_category = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"debug"];
    debug = v5->_debug;
    v5->_debug = (NSString *)v17;

    uint64_t v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"relatedItems"];
    relatedItems = v5->_relatedItems;
    v5->_relatedItems = (NSOrderedSet *)v22;

    v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"associatedResults"];
    associatedResults = v5->_associatedResults;
    v5->_associatedResults = (NSArray *)v27;

    v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_opt_class();
    v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"tags"];
    tags = v5->_tags;
    v5->_tags = (NSSet *)v32;

    v5->_minPrefix = [v4 decodeIntegerForKey:@"minPrefix"];
    v5->_exactMatch = [v4 decodeBoolForKey:@"exactMatch"];
    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extractedStartDateComponents"];
    extractedStartDateComponents = v5->_extractedStartDateComponents;
    v5->_extractedStartDateComponents = (NSDateComponents *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extractedEndDateComponents"];
    extractedEndDateComponents = v5->_extractedEndDateComponents;
    v5->_extractedEndDateComponents = (NSDateComponents *)v36;

    v38 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v39 = objc_opt_class();
    v40 = objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
    uint64_t v41 = [v4 decodeObjectOfClasses:v40 forKey:@"extractedAddressComponents"];
    extractedAddressComponents = v5->_extractedAddressComponents;
    v5->_extractedAddressComponents = (NSDictionary *)v41;

    v5->_onScreen = [v4 decodeBoolForKey:@"onScreen"];
    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sceneIdentifier"];
    sceneIdentifier = v5->_sceneIdentifier;
    v5->_sceneIdentifier = (NSString *)v43;

    [v4 decodeDoubleForKey:@"frameInWindow.x"];
    CGFloat v46 = v45;
    [v4 decodeDoubleForKey:@"frameInWindow.y"];
    CGFloat v48 = v47;
    [v4 decodeDoubleForKey:@"frameInWindow.width"];
    CGFloat v50 = v49;
    [v4 decodeDoubleForKey:@"frameInWindow.height"];
    v5->_frameInWindow.origin.x = v46;
    v5->_frameInWindow.origin.y = v48;
    v5->_frameInWindow.size.width = v50;
    v5->_frameInWindow.size.height = v51;
    [v4 decodeDoubleForKey:@"absoluteOrigin.x"];
    CGFloat v53 = v52;
    [v4 decodeDoubleForKey:@"absoluteOrigin.y"];
    v5->_absoluteOriginOnScreen.x = v53;
    v5->_absoluteOriginOnScreen.y = v54;
  }

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTopicId:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKContextResult *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      title = self->_title;
      v8 = [(CKContextResult *)v4 title];
      char v6 = [(NSString *)title isEqualToString:v8];
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return 31 * [(NSString *)self->_title hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTitle:query:url:category:", self->_title, self->_query, 0, self->_category);
  [v4 setUrl:self->_url];
  [v4 setTopicId:self->_topicId];
  [v4 setDebug:self->_debug];
  [v4 setRelatedItems:self->_relatedItems];
  [v4 setAssociatedResults:self->_associatedResults];
  [v4 setTags:self->_tags];
  [v4 setMinPrefix:self->_minPrefix];
  [v4 setExactMatch:self->_exactMatch];
  [v4 setExtractedStartDateComponents:self->_extractedStartDateComponents];
  [v4 setExtractedEndDateComponents:self->_extractedEndDateComponents];
  [v4 setExtractedAddressComponents:self->_extractedAddressComponents];
  objc_msgSend(v4, "setFrameInWindow:", self->_frameInWindow.origin.x, self->_frameInWindow.origin.y, self->_frameInWindow.size.width, self->_frameInWindow.size.height);
  objc_msgSend(v4, "setAbsoluteOriginOnScreen:", self->_absoluteOriginOnScreen.x, self->_absoluteOriginOnScreen.y);
  [v4 setOnScreen:self->_onScreen];
  [v4 setSceneIdentifier:self->_sceneIdentifier];
  return v4;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CKContextResult;
  id v4 = [(CKContextResult *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@: %@", v4, self->_title];

  return v5;
}

- (id)toJSONSerializableDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_title forKeyedSubscript:@"title"];
  id v4 = [NSNumber numberWithInteger:self->_minPrefix];
  [v3 setObject:v4 forKeyedSubscript:@"minPrefix"];

  uint64_t v5 = [NSNumber numberWithBool:self->_exactMatch];
  [v3 setObject:v5 forKeyedSubscript:@"exactMatch"];

  char v6 = [NSNumber numberWithDouble:self->_absoluteOriginOnScreen.x];
  [v3 setObject:v6 forKeyedSubscript:@"absoluteOriginX"];

  objc_super v7 = [NSNumber numberWithDouble:self->_absoluteOriginOnScreen.y];
  [v3 setObject:v7 forKeyedSubscript:@"absoluteOriginY"];

  v8 = [NSNumber numberWithDouble:self->_frameInWindow.origin.x];
  [v3 setObject:v8 forKeyedSubscript:@"x"];

  uint64_t v9 = [NSNumber numberWithDouble:self->_frameInWindow.origin.y];
  [v3 setObject:v9 forKeyedSubscript:@"y"];

  id v10 = [NSNumber numberWithDouble:self->_frameInWindow.size.width];
  [v3 setObject:v10 forKeyedSubscript:@"width"];

  uint64_t v11 = [NSNumber numberWithDouble:self->_frameInWindow.size.height];
  [v3 setObject:v11 forKeyedSubscript:@"height"];

  id v12 = [NSNumber numberWithBool:self->_onScreen];
  [v3 setObject:v12 forKeyedSubscript:@"onScreen"];

  query = self->_query;
  if (query) {
    [v3 setObject:query forKeyedSubscript:@"query"];
  }
  url = self->_url;
  if (url)
  {
    uint64_t v15 = [(NSURL *)url absoluteString];
    [v3 setObject:v15 forKeyedSubscript:@"urlString"];
  }
  topicId = self->_topicId;
  if (topicId) {
    [v3 setObject:topicId forKeyedSubscript:@"topicId"];
  }
  category = self->_category;
  if (category) {
    [v3 setObject:category forKeyedSubscript:@"category"];
  }
  debug = self->_debug;
  if (debug) {
    [v3 setObject:debug forKeyedSubscript:@"debug"];
  }
  relatedItems = self->_relatedItems;
  if (relatedItems)
  {
    uint64_t v20 = [(NSOrderedSet *)relatedItems array];
    [v3 setObject:v20 forKeyedSubscript:@"relatedItems"];
  }
  tags = self->_tags;
  if (tags)
  {
    uint64_t v22 = [(NSSet *)tags allObjects];
    [v3 setObject:v22 forKeyedSubscript:@"tags"];
  }
  associatedResults = self->_associatedResults;
  if (associatedResults)
  {
    v24 = [(NSArray *)associatedResults valueForKey:@"toJSONSerializableDictionary"];
    [v3 setObject:v24 forKeyedSubscript:@"associatedResults"];
  }
  if ([(NSString *)self->_sceneIdentifier length]) {
    [v3 setObject:self->_sceneIdentifier forKeyedSubscript:@"sceneIdentifier"];
  }
  return v3;
}

- (void)setTitle:(id)a3
{
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (int64_t)minPrefix
{
  return self->_minPrefix;
}

- (void)setMinPrefix:(int64_t)a3
{
  self->_minPrefix = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (NSString)debug
{
  return self->_debug;
}

- (void)setDebug:(id)a3
{
}

- (NSSet)tags
{
  return self->_tags;
}

- (void)setTags:(id)a3
{
}

- (BOOL)isExactMatch
{
  return self->_exactMatch;
}

- (void)setExactMatch:(BOOL)a3
{
  self->_exactMatch = a3;
}

- (NSDateComponents)extractedStartDateComponents
{
  return self->_extractedStartDateComponents;
}

- (void)setExtractedStartDateComponents:(id)a3
{
}

- (NSDateComponents)extractedEndDateComponents
{
  return self->_extractedEndDateComponents;
}

- (void)setExtractedEndDateComponents:(id)a3
{
}

- (NSDictionary)extractedAddressComponents
{
  return self->_extractedAddressComponents;
}

- (void)setExtractedAddressComponents:(id)a3
{
}

- (CGRect)frameInWindow
{
  double x = self->_frameInWindow.origin.x;
  double y = self->_frameInWindow.origin.y;
  double width = self->_frameInWindow.size.width;
  double height = self->_frameInWindow.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrameInWindow:(CGRect)a3
{
  self->_frameInWindow = a3;
}

- (CGPoint)absoluteOriginOnScreen
{
  double x = self->_absoluteOriginOnScreen.x;
  double y = self->_absoluteOriginOnScreen.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAbsoluteOriginOnScreen:(CGPoint)a3
{
  self->_absoluteOriginOnScreen = a3;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (void)setOnScreen:(BOOL)a3
{
  self->_onScreen = a3;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
}

- (NSArray)associatedResults
{
  return self->_associatedResults;
}

- (void)setAssociatedResults:(id)a3
{
}

@end