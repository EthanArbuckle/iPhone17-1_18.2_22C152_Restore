@interface BCSRealTimeShardSignposter
- (id)_initWithShardType:(int64_t)a3 signpostIdentifier:(unint64_t)a4;
- (int64_t)shardType;
@end

@implementation BCSRealTimeShardSignposter

- (id)_initWithShardType:(int64_t)a3 signpostIdentifier:(unint64_t)a4
{
  if ((unint64_t)(a3 - 2) > 3) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = qword_215570AA8[a3 - 2];
  }
  v7.receiver = self;
  v7.super_class = (Class)BCSRealTimeShardSignposter;
  id result = [(BCSRealTimeSignposter *)&v7 _initWithType:v5 signpostIdentifier:a4];
  if (result) {
    *((void *)result + 3) = a3;
  }
  return result;
}

- (int64_t)shardType
{
  return self->_shardType;
}

@end