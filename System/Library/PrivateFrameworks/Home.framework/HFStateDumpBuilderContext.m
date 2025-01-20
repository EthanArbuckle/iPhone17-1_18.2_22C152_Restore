@interface HFStateDumpBuilderContext
+ (HFStateDumpBuilderContext)contextWithDetailLevel:(unint64_t)a3;
- (BOOL)excludePrimaryID;
- (BOOL)includeVolatileObjects;
- (HFStateDumpBuilderContext)init;
- (HFStateDumpBuilderContext)initWithContext:(id)a3;
- (HFStateDumpBuilderContext)initWithDetailLevel:(unint64_t)a3;
- (NSDictionary)userInfo;
- (NSSet)objectsToExclude;
- (NSString)multilinePrefix;
- (id)copyWithDetailLevel:(unint64_t)a3;
- (id)copyWithOutputStyle:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)derivedOutputStyle;
- (unint64_t)detailLevel;
- (unint64_t)outputStyle;
- (void)setDetailLevel:(unint64_t)a3;
- (void)setExcludePrimaryID:(BOOL)a3;
- (void)setIncludeVolatileObjects:(BOOL)a3;
- (void)setMultilinePrefix:(id)a3;
- (void)setObjectsToExclude:(id)a3;
- (void)setOutputStyle:(unint64_t)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation HFStateDumpBuilderContext

+ (HFStateDumpBuilderContext)contextWithDetailLevel:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithDetailLevel:a3];
  return (HFStateDumpBuilderContext *)v3;
}

- (HFStateDumpBuilderContext)init
{
  return [(HFStateDumpBuilderContext *)self initWithDetailLevel:0];
}

- (HFStateDumpBuilderContext)initWithDetailLevel:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HFStateDumpBuilderContext;
  result = [(HFStateDumpBuilderContext *)&v5 init];
  if (result) {
    result->_detailLevel = a3;
  }
  return result;
}

- (HFStateDumpBuilderContext)initWithContext:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFStateDumpBuilderContext;
  objc_super v5 = [(HFStateDumpBuilderContext *)&v13 init];
  if (v5)
  {
    v5->_detailLevel = [v4 detailLevel];
    v5->_outputStyle = [v4 outputStyle];
    uint64_t v6 = [v4 objectsToExclude];
    objectsToExclude = v5->_objectsToExclude;
    v5->_objectsToExclude = (NSSet *)v6;

    uint64_t v8 = [v4 userInfo];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v8;

    uint64_t v10 = [v4 multilinePrefix];
    multilinePrefix = v5->_multilinePrefix;
    v5->_multilinePrefix = (NSString *)v10;

    v5->_excludePrimaryID = [v4 excludePrimaryID];
    v5->_includeVolatileObjects = [v4 includeVolatileObjects];
  }

  return v5;
}

- (NSSet)objectsToExclude
{
  objectsToExclude = self->_objectsToExclude;
  if (objectsToExclude)
  {
    v3 = objectsToExclude;
  }
  else
  {
    v3 = [MEMORY[0x263EFFA08] set];
  }
  return v3;
}

- (NSDictionary)userInfo
{
  if (self->_userInfo) {
    return self->_userInfo;
  }
  else {
    return (NSDictionary *)MEMORY[0x263EFFA78];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[HFStateDumpBuilderContext allocWithZone:a3];
  return [(HFStateDumpBuilderContext *)v4 initWithContext:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[HFMutableStateDumpBuilderContext allocWithZone:a3];
  return [(HFStateDumpBuilderContext *)v4 initWithContext:self];
}

- (id)copyWithDetailLevel:(unint64_t)a3
{
  id v4 = (void *)[(HFStateDumpBuilderContext *)self mutableCopy];
  [v4 setDetailLevel:a3];
  return v4;
}

- (id)copyWithOutputStyle:(unint64_t)a3
{
  id v4 = (void *)[(HFStateDumpBuilderContext *)self mutableCopy];
  [v4 setOutputStyle:a3];
  return v4;
}

- (unint64_t)derivedOutputStyle
{
  if (![(HFStateDumpBuilderContext *)self outputStyle])
  {
    unint64_t v3 = [(HFStateDumpBuilderContext *)self detailLevel];
    if (v3 < 3) {
      return v3 + 1;
    }
  }
  return [(HFStateDumpBuilderContext *)self outputStyle];
}

- (unint64_t)detailLevel
{
  return self->_detailLevel;
}

- (void)setDetailLevel:(unint64_t)a3
{
  self->_detailLevel = a3;
}

- (unint64_t)outputStyle
{
  return self->_outputStyle;
}

- (void)setOutputStyle:(unint64_t)a3
{
  self->_outputStyle = a3;
}

- (void)setObjectsToExclude:(id)a3
{
}

- (void)setUserInfo:(id)a3
{
}

- (BOOL)excludePrimaryID
{
  return self->_excludePrimaryID;
}

- (void)setExcludePrimaryID:(BOOL)a3
{
  self->_excludePrimaryID = a3;
}

- (BOOL)includeVolatileObjects
{
  return self->_includeVolatileObjects;
}

- (void)setIncludeVolatileObjects:(BOOL)a3
{
  self->_includeVolatileObjects = a3;
}

- (NSString)multilinePrefix
{
  return self->_multilinePrefix;
}

- (void)setMultilinePrefix:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multilinePrefix, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_objectsToExclude, 0);
}

@end