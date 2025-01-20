@interface NSKeyValueChangeDictionary
- (NSKeyValueChangeDictionary)initWithDetailsNoCopy:(id *)a3 originalObservable:(id)a4 isPriorNotification:(BOOL)a5;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)dealloc;
- (void)retainObjects;
- (void)setDetailsNoCopy:(id *)a3 originalObservable:(id)a4;
- (void)setOriginalObservable:(id)a3;
@end

@implementation NSKeyValueChangeDictionary

- (NSKeyValueChangeDictionary)initWithDetailsNoCopy:(id *)a3 originalObservable:(id)a4 isPriorNotification:(BOOL)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)NSKeyValueChangeDictionary;
  result = [(NSKeyValueChangeDictionary *)&v11 init];
  if (result)
  {
    id var4 = a3->var4;
    long long v10 = *(_OWORD *)&a3->var2;
    *(_OWORD *)&result->_details.kind = *(_OWORD *)&a3->var0;
    *(_OWORD *)&result->_details.newValue = v10;
    result->_details.extraData = var4;
    result->_originalObservable = a4;
    result->_isPriorNotification = a5;
  }
  return result;
}

- (void)setDetailsNoCopy:(id *)a3 originalObservable:(id)a4
{
  if (self->_isRetainingObjects)
  {
    p_details = &self->_details;

    self->_isRetainingObjects = 0;
  }
  long long v8 = *(_OWORD *)&a3->var0;
  long long v9 = *(_OWORD *)&a3->var2;
  self->_details.extraData = a3->var4;
  *(_OWORD *)&self->_details.kind = v8;
  *(_OWORD *)&self->_details.newValue = v9;
  self->_originalObservable = a4;
}

- (void)retainObjects
{
  if (!self->_isRetainingObjects)
  {
    p_details = &self->_details;
    v4 = self->_details.oldValue;
    v5 = p_details->newValue;
    v6 = p_details->indexes;
    v7 = self->_originalObservable;
    self->_isRetainingObjects = 1;
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (self->_isRetainingObjects)
  {

    self->_isRetainingObjects = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueChangeDictionary;
  [(NSKeyValueChangeDictionary *)&v3 dealloc];
}

- (id)keyEnumerator
{
  v6[10] = *MEMORY[0x1E4F143B8];
  v6[0] = @"kind";
  if (self->_details.oldValue)
  {
    v6[1] = @"old";
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 1;
  }
  if (self->_details.newValue) {
    v6[v2++] = @"new";
  }
  if (self->_details.indexes) {
    v6[v2++] = @"indexes";
  }
  if (self->_originalObservable) {
    v6[v2++] = 0x1ECA68008;
  }
  if (self->_isPriorNotification) {
    v6[v2++] = @"notificationIsPrior";
  }
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v6 count:v2];
  uint64_t v4 = (void *)[v3 objectEnumerator];

  return v4;
}

- (unint64_t)count
{
  uint64_t v2 = 1;
  if (self->_details.oldValue) {
    uint64_t v2 = 2;
  }
  if (self->_details.newValue) {
    ++v2;
  }
  if (self->_details.indexes) {
    uint64_t v3 = v2 + 1;
  }
  else {
    uint64_t v3 = v2;
  }
  if (self->_originalObservable) {
    ++v3;
  }
  return v3 + self->_isPriorNotification;
}

- (id)objectForKey:(id)a3
{
  if (@"kind" != a3)
  {
    if (@"new" == a3) {
      return self->_details.newValue;
    }
    if (@"old" == a3) {
      return self->_details.oldValue;
    }
    if (@"indexes" == a3) {
      return self->_details.indexes;
    }
    if (a3 != @"originalObservable")
    {
      if (@"notificationIsPrior" == a3 && self->_isPriorNotification) {
        return (id)*MEMORY[0x1E4F1CFD0];
      }
      if (objc_msgSend(a3, "isEqualToString:")) {
        goto LABEL_8;
      }
      if ([a3 isEqualToString:@"new"]) {
        return self->_details.newValue;
      }
      if ([a3 isEqualToString:@"old"]) {
        return self->_details.oldValue;
      }
      if ([a3 isEqualToString:@"indexes"]) {
        return self->_details.indexes;
      }
      if (![a3 isEqualToString:0x1ECA68008])
      {
        if (![a3 isEqualToString:@"notificationIsPrior"]) {
          return 0;
        }
        if (self->_isPriorNotification) {
          return (id)*MEMORY[0x1E4F1CFD0];
        }
        return 0;
      }
    }
    return self->_originalObservable;
  }
LABEL_8:
  unint64_t kind = self->_details.kind;

  return +[NSNumber numberWithInteger:kind];
}

- (void)setOriginalObservable:(id)a3
{
  originalObservable = self->_originalObservable;
  if (originalObservable != a3)
  {
    if (self->_isRetainingObjects)
    {
      id v6 = a3;

      a3 = v6;
    }
    self->_originalObservable = a3;
    if (self->_isRetainingObjects)
    {
      id v5 = a3;
    }
  }
}

@end