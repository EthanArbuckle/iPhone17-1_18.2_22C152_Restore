@interface PKProofreadingItem
+ (id)proofreadingItemWithQueryItem:(id)a3 sessionManager:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)chStrokeIdentifiers;
- (NSArray)replacementStrings;
- (id)_baselinePath;
- (id)drawing;
- (id)strokeColor;
- (int)resultType;
- (unint64_t)hash;
- (void)invalidateUUID;
@end

@implementation PKProofreadingItem

+ (id)proofreadingItemWithQueryItem:(id)a3 sessionManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 strokeIdentifiers];
  v8 = -[PKRecognitionSessionManager drawing](v6);
  int valid = HasValidInkForDetectionItem(v7, v8);

  if (valid)
  {
    v10 = [(PKDetectionItem *)[PKProofreadingItem alloc] initWithSessionManager:v6];
    [(PKDetectionItem *)v10 setQueryItem:v5];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)drawing
{
  v2 = [(PKDetectionItem *)self sessionManager];
  v3 = -[PKRecognitionSessionManager drawing](v2);

  return v3;
}

- (id)_baselinePath
{
  v2 = [(PKDetectionItem *)self queryItem];
  v3 = [v2 baselinePath];

  return v3;
}

- (id)strokeColor
{
  return (id)[MEMORY[0x1E4FB1618] systemTealColor];
}

- (NSArray)chStrokeIdentifiers
{
  v2 = [(PKDetectionItem *)self queryItem];
  v3 = [v2 strokeIdentifiers];
  v4 = [v3 allObjects];

  return (NSArray *)v4;
}

- (NSArray)replacementStrings
{
  v2 = [(PKDetectionItem *)self queryItem];
  v3 = [v2 replacementStrings];

  return (NSArray *)v3;
}

- (int)resultType
{
  v2 = [(PKDetectionItem *)self queryItem];
  int v3 = [v2 resultType];

  return v3;
}

- (unint64_t)hash
{
  v2 = [(PKDetectionItem *)self queryItem];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKProofreadingItem *)a3;
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

- (void)invalidateUUID
{
}

@end