@interface PFUbiquityMergeConflict
- (NSDictionary)ancestorSnapshot;
- (PFUbiquityMergeConflict)initWithSource:(id)a3 newVersion:(unint64_t)a4 oldVersion:(unint64_t)a5 cachedSnapshot:(id)a6 persistedSnapshot:(id)a7;
- (void)dealloc;
- (void)setAncestorSnapshot:(id)a3;
@end

@implementation PFUbiquityMergeConflict

- (PFUbiquityMergeConflict)initWithSource:(id)a3 newVersion:(unint64_t)a4 oldVersion:(unint64_t)a5 cachedSnapshot:(id)a6 persistedSnapshot:(id)a7
{
  v8.receiver = self;
  v8.super_class = (Class)PFUbiquityMergeConflict;
  return [(NSMergeConflict *)&v8 initWithSource:a3 newVersion:a4 oldVersion:a5 cachedSnapshot:a6 persistedSnapshot:a7];
}

- (void)dealloc
{
  [(PFUbiquityMergeConflict *)self setAncestorSnapshot:0];
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityMergeConflict;
  [(NSMergeConflict *)&v3 dealloc];
}

- (NSDictionary)ancestorSnapshot
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAncestorSnapshot:(id)a3
{
}

@end