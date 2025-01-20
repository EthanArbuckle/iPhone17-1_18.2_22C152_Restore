@interface NSProgressValues
+ (BOOL)supportsSecureCoding;
+ (id)_importantKeys;
+ (id)decodableClasses;
- (BOOL)isFinished;
- (BOOL)isIndeterminate;
- (NSProgressValues)init;
- (NSProgressValues)initWithCoder:(id)a3;
- (_NSProgressFraction)overallFraction;
- (double)fractionCompleted;
- (id)_indentedDescription:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)completedUnitCount;
- (int64_t)totalUnitCount;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCompletedUnitCount:(int64_t)a3;
- (void)setTotalUnitCount:(int64_t)a3;
@end

@implementation NSProgressValues

- (NSProgressValues)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSProgressValues;
  result = [(NSProgressValues *)&v3 init];
  if (result)
  {
    result->_isCancellable = 1;
    *(_OWORD *)&result->_selfFraction.overflowed = 0u;
    *(_OWORD *)&result->_childFraction.total = 0u;
    *(_OWORD *)&result->_selfFraction.completed = 0u;
    result->_childFraction.total = 1;
  }
  return result;
}

- (double)fractionCompleted
{
  if (self) {
    [(NSProgressValues *)self overallFraction];
  }
  return 0.0;
}

- (_NSProgressFraction)overallFraction
{
  *(void *)&retstr->overflowed = 0;
  *retstr = self->_selfFraction;
  return (_NSProgressFraction *)_NSProgressFractionAddFraction((uint64_t)retstr, &self->_childFraction.completed);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSProgressValues;
  [(NSProgressValues *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v4 + 8) = [(NSMutableDictionary *)self->_userInfo mutableCopy];
  uint64_t v5 = *(void *)&self->_selfFraction.overflowed;
  *(_OWORD *)(v4 + 16) = *(_OWORD *)&self->_selfFraction.completed;
  *(void *)(v4 + 32) = v5;
  long long v6 = *(_OWORD *)&self->_childFraction.completed;
  *(void *)(v4 + 56) = *(void *)&self->_childFraction.overflowed;
  *(_OWORD *)(v4 + 40) = v6;
  *(void *)(v4 + 72) = [(NSString *)self->_localizedDescription copy];
  *(void *)(v4 + 80) = [(NSString *)self->_localizedAdditionalDescription copy];
  *(unsigned char *)(v4 + 104) = self->_isCancellable;
  *(unsigned char *)(v4 + 105) = self->_isPausable;
  *(unsigned char *)(v4 + 106) = self->_isCancelled;
  *(unsigned char *)(v4 + 107) = self->_isPaused;
  *(void *)(v4 + 88) = [(NSString *)self->_kind mutableCopy];
  *(unsigned char *)(v4 + 109) = self->_isPrioritizable;
  return (id)v4;
}

+ (id)_importantKeys
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"totalUnitCount", 0);
}

- (id)_indentedDescription:(unint64_t)a3
{
  v9[5] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[NSString string];
  for (i = +[NSString string]; a3; --a3)
    [(NSString *)i appendString:@"  "];
  [(NSString *)v5 appendFormat:@"%@self: %@", i, _NSProgressFractionDescription(&self->_selfFraction.completed)];
  [(NSString *)v5 appendFormat:@"\n%@children: %@", i, _NSProgressFractionDescription(&self->_childFraction.completed)];
  [(NSString *)v5 appendFormat:@"\n%@localizedDescription: %@", i, self->_localizedDescription];
  [(NSString *)v5 appendFormat:@"\n%@localizedAdditionalDescription: %@", i, self->_localizedAdditionalDescription];
  [(NSString *)v5 appendFormat:@"\n%@isCancellable: %@", i, +[NSNumber numberWithBool:self->_isCancellable]];
  [(NSString *)v5 appendFormat:@"\n%@isPausable: %@", i, +[NSNumber numberWithBool:self->_isPausable]];
  [(NSString *)v5 appendFormat:@"\n%@isCancelled: %@", i, +[NSNumber numberWithBool:self->_isCancelled]];
  [(NSString *)v5 appendFormat:@"\n%@isPaused: %@", i, +[NSNumber numberWithBool:self->_isPaused]];
  [(NSString *)v5 appendFormat:@"\n%@isPrioritizable: %@", i, +[NSNumber numberWithBool:self->_isPrioritizable]];
  [(NSString *)v5 appendFormat:@"\n%@kind: %@", i, self->_kind];
  [(NSString *)v5 appendFormat:@"\n%@userInfo: {", i];
  userInfo = self->_userInfo;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__NSProgressValues__indentedDescription___block_invoke;
  v9[3] = &unk_1E51F7840;
  v9[4] = v5;
  [(NSMutableDictionary *)userInfo enumerateKeysAndObjectsUsingBlock:v9];
  -[NSString deleteCharactersInRange:](v5, "deleteCharactersInRange:", [(NSString *)v5 length] - 2, 2);
  [(NSString *)v5 appendFormat:@"}"];
  return v5;
}

uint64_t __41__NSProgressValues__indentedDescription___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@ : %@, ", a2, a3];
}

- (id)description
{
  return [(NSProgressValues *)self _indentedDescription:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)decodableClasses
{
  if (qword_1EB1ECEE8 != -1) {
    dispatch_once(&qword_1EB1ECEE8, &__block_literal_global_176);
  }
  return (id)qword_1EB1ECEF0;
}

uint64_t __36__NSProgressValues_decodableClasses__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t result = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  qword_1EB1ECEF0 = result;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  void v9[6] = *MEMORY[0x1E4F143B8];
  Class v5 = objc_lookUpClass("NSImage");
  userInfo = self->_userInfo;
  if (v5)
  {
    uint64_t v7 = (NSMutableDictionary *)[(NSMutableDictionary *)userInfo mutableCopy];
    uint64_t v8 = self->_userInfo;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __36__NSProgressValues_encodeWithCoder___block_invoke;
    v9[3] = &unk_1E51FBAD0;
    v9[4] = v5;
    v9[5] = v7;
    [(NSMutableDictionary *)v8 enumerateKeysAndObjectsUsingBlock:v9];
  }
  else
  {
    uint64_t v7 = userInfo;
  }
  [a3 encodeObject:v7 forKey:@"userInfo"];
  [a3 encodeInt64:self->_selfFraction.completed forKey:@"selfFraction.completed"];
  [a3 encodeInt64:self->_selfFraction.total forKey:@"selfFraction.total"];
  [a3 encodeBool:self->_selfFraction.overflowed forKey:@"selfFraction.overflowed"];
  [a3 encodeInt64:self->_childFraction.completed forKey:@"childFraction.completed"];
  [a3 encodeInt64:self->_childFraction.total forKey:@"childFraction.total"];
  [a3 encodeBool:self->_childFraction.overflowed forKey:@"childFraction.overflowed"];
  [a3 encodeObject:self->_localizedDescription forKey:@"localizedDescription"];
  [a3 encodeObject:self->_localizedAdditionalDescription forKey:@"localizedAdditionalDescription"];
  [a3 encodeBool:self->_isCancellable forKey:@"cancellable"];
  [a3 encodeBool:self->_isPausable forKey:@"pausable"];
  [a3 encodeBool:self->_isCancelled forKey:@"cancelled"];
  [a3 encodeBool:self->_isPaused forKey:@"paused"];
  [a3 encodeObject:self->_kind forKey:@"kind"];
  [a3 encodeBool:self->_isPrioritizable forKey:@"prioritizable"];
}

uint64_t __36__NSProgressValues_encodeWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    [*(id *)(a1 + 40) removeObjectForKey:a2];
    uint64_t result = [a3 performSelector:sel_TIFFRepresentation];
    if (result)
    {
      uint64_t v7 = result;
      uint64_t v8 = *(void **)(a1 + 40);
      uint64_t v9 = [a2 stringByAppendingString:@".data"];
      return [v8 setObject:v7 forKey:v9];
    }
  }
  return result;
}

- (NSProgressValues)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSProgressValues;
  uint64_t v4 = [(NSProgressValues *)&v6 init];
  if (v4)
  {
    v4->_userInfo = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend((id)objc_msgSend(a3, "allowedClasses"), "setByAddingObjectsFromSet:", objc_msgSend((id)objc_opt_class(), "decodableClasses")), @"userInfo");
    v4->_selfFraction.completed = [a3 decodeInt64ForKey:@"selfFraction.completed"];
    v4->_selfFraction.total = [a3 decodeInt64ForKey:@"selfFraction.total"];
    v4->_selfFraction.overflowed = [a3 decodeInt64ForKey:@"selfFraction.overflowed"] != 0;
    v4->_childFraction.completed = [a3 decodeInt64ForKey:@"childFraction.completed"];
    v4->_childFraction.total = [a3 decodeInt64ForKey:@"childFraction.total"];
    v4->_childFraction.overflowed = [a3 decodeInt64ForKey:@"childFraction.overflowed"] != 0;
    v4->_localizedDescription = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDescription"];
    v4->_localizedAdditionalDescription = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"localizedAdditionalDescription"];
    v4->_isCancellable = [a3 decodeBoolForKey:@"cancellable"];
    v4->_isPausable = [a3 decodeBoolForKey:@"pausable"];
    v4->_isCancelled = [a3 decodeBoolForKey:@"cancelled"];
    v4->_isPaused = [a3 decodeBoolForKey:@"paused"];
    v4->_kind = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
    v4->_isPrioritizable = [a3 decodeBoolForKey:@"prioritizable"];
  }
  return v4;
}

- (BOOL)isIndeterminate
{
  int64_t completed = self->_selfFraction.completed;
  if (completed < 0) {
    return 1;
  }
  int64_t total = self->_selfFraction.total;
  BOOL v4 = (total | completed) == 0;
  return total < 0 || v4;
}

- (BOOL)isFinished
{
  int64_t completed = self->_selfFraction.completed;
  int64_t total = self->_selfFraction.total;
  BOOL v5 = completed > 0 && total == 0;
  return completed >= 1 && completed >= total && total > 0 || v5;
}

- (int64_t)completedUnitCount
{
  return self->_selfFraction.completed;
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  self->_selfFraction.int64_t completed = a3;
}

- (int64_t)totalUnitCount
{
  return self->_selfFraction.total;
}

- (void)setTotalUnitCount:(int64_t)a3
{
  self->_selfFraction.int64_t total = a3;
}

@end