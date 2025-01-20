@interface PKHashtagItem
+ (id)hashtagItemWithQueryItem:(id)a3 sessionManager:(id)a4;
- (BOOL)active;
- (BOOL)isEqual:(id)a3;
- (NSString)hashtagResult;
- (id)_actionNameForActivation:(BOOL)a3;
- (id)_baselinePath;
- (id)description;
- (id)setActive:(BOOL)a3;
- (unint64_t)hash;
- (void)clearActiveInDrawing:(id)a3;
- (void)invalidateUUID;
@end

@implementation PKHashtagItem

+ (id)hashtagItemWithQueryItem:(id)a3 sessionManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 strokeIdentifiers];
  v8 = -[PKRecognitionSessionManager drawing](v6);
  int valid = HasValidInkForDetectionItem(v7, v8);

  if (valid)
  {
    v10 = [(PKDetectionItem *)[PKHashtagItem alloc] initWithSessionManager:v6];
    [(PKDetectionItem *)v10 setQueryItem:v5];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_baselinePath
{
  v2 = [(PKDetectionItem *)self queryItem];
  v3 = [v2 baselinePath];

  return v3;
}

- (NSString)hashtagResult
{
  v2 = [(PKDetectionItem *)self queryItem];
  v3 = [v2 hashtagResult];

  return (NSString *)v3;
}

- (id)setActive:(BOOL)a3
{
  if (a3)
  {
    v4 = [MEMORY[0x1E4F29128] UUID];
    id v5 = [(PKDetectionItem *)self setUUID:v4];
  }
  else
  {
    id v5 = [(PKDetectionItem *)self setUUID:0];
  }

  return v5;
}

- (BOOL)active
{
  v2 = [(PKDetectionItem *)self UUID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)clearActiveInDrawing:(id)a3
{
  id v8 = a3;
  v4 = [(PKDetectionItem *)self queryItem];
  id v5 = [v4 strokeIdentifiers];
  id v6 = [v5 allObjects];
  v7 = [v8 strokesForCHStrokeIdentifiers:v6];
  [v8 setStrokes:v7 groupID:0];
}

- (unint64_t)hash
{
  v2 = [(PKDetectionItem *)self queryItem];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKHashtagItem *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(PKDetectionItem *)self queryItem];
      id v6 = [(PKDetectionItem *)v4 queryItem];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)_actionNameForActivation:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = _PencilKitBundle();
  id v5 = v4;
  if (v3) {
    [v4 localizedStringForKey:@"Activate Hashtag" value:@"Activate Hashtag" table:@"Localizable"];
  }
  else {
  id v6 = [v4 localizedStringForKey:@"Deactivate Hashtag" value:@"Deactivate Hashtag" table:@"Localizable"];
  }

  return v6;
}

- (void)invalidateUUID
{
}

- (id)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(PKHashtagItem *)self hashtagResult];
  id v6 = [(PKHashtagItem *)self hashtagUUID];
  char v7 = [(PKDetectionItem *)self queryItem];
  id v8 = [v7 strokeIdentifiers];
  v9 = [v3 stringWithFormat:@"%@:%p, \"%@\", %@, strokes:%lu", v4, self, v5, v6, objc_msgSend(v8, "count")];

  return v9;
}

@end