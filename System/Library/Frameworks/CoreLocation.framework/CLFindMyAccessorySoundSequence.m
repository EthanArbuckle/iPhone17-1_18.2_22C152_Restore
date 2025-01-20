@interface CLFindMyAccessorySoundSequence
+ (BOOL)supportsSecureCoding;
+ (id)defaultSequence;
+ (id)rangingSequence;
+ (id)shortSequence;
- (CLFindMyAccessorySoundSequence)init;
- (CLFindMyAccessorySoundSequence)initWithCoder:(id)a3;
- (CLFindMyAccessorySoundSequence)initWithType:(unint64_t)a3;
- (CLFindMyAccessorySoundSequence)initWithType:(unint64_t)a3 encodedSequence:(id)a4;
- (NSData)encodedSequence;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)type;
- (void)addSoundBlockWithAsset:(unint64_t)a3 loopCount:(unsigned __int8)a4 duration:(unsigned __int16)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLFindMyAccessorySoundSequence

- (CLFindMyAccessorySoundSequence)initWithType:(unint64_t)a3 encodedSequence:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CLFindMyAccessorySoundSequence;
  v6 = [(CLFindMyAccessorySoundSequence *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = a3;
    if (a4) {
      v8 = (NSMutableData *)a4;
    }
    else {
      v8 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    }
    v7->_encodedSequence = v8;
  }
  return v7;
}

- (CLFindMyAccessorySoundSequence)initWithType:(unint64_t)a3
{
  return (CLFindMyAccessorySoundSequence *)MEMORY[0x1F4181798](self, sel_initWithType_encodedSequence_);
}

- (CLFindMyAccessorySoundSequence)init
{
  return (CLFindMyAccessorySoundSequence *)MEMORY[0x1F4181798](self, sel_initWithType_encodedSequence_);
}

+ (id)defaultSequence
{
  v2 = [[CLFindMyAccessorySoundSequence alloc] initWithType:1];
  [(CLFindMyAccessorySoundSequence *)v2 addSoundBlockWithAsset:4 loopCount:1 duration:0];
  [(CLFindMyAccessorySoundSequence *)v2 addSoundBlockWithAsset:5 loopCount:2 duration:0];

  return v2;
}

+ (id)shortSequence
{
  v2 = [[CLFindMyAccessorySoundSequence alloc] initWithType:0];

  return v2;
}

+ (id)rangingSequence
{
  v2 = [[CLFindMyAccessorySoundSequence alloc] initWithType:0];
  [(CLFindMyAccessorySoundSequence *)v2 addSoundBlockWithAsset:4 loopCount:1 duration:0];

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLFindMyAccessorySoundSequence;
  [(CLFindMyAccessorySoundSequence *)&v3 dealloc];
}

- (void)addSoundBlockWithAsset:(unint64_t)a3 loopCount:(unsigned __int8)a4 duration:(unsigned __int16)a5
{
  unsigned __int8 v8 = a4;
  unsigned __int16 v7 = a5;
  char v6 = a3;
  [(NSMutableData *)self->_encodedSequence appendBytes:&v6 length:1];
  [(NSMutableData *)self->_encodedSequence appendBytes:&v8 length:1];
  [(NSMutableData *)self->_encodedSequence appendBytes:&v7 length:2];
}

- (NSData)encodedSequence
{
  return &self->_encodedSequence->super;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CLFindMyAccessorySoundSequence alloc];
  [(NSMutableData *)self->_encodedSequence mutableCopy];

  return (id)MEMORY[0x1F4181798](v4, sel_initWithType_encodedSequence_);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLFindMyAccessorySoundSequence)initWithCoder:(id)a3
{
  v4 = [CLFindMyAccessorySoundSequence alloc];
  [a3 decodeIntegerForKey:@"Type"];
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"EncodedSequence"];

  return (CLFindMyAccessorySoundSequence *)MEMORY[0x1F4181798](v4, sel_initWithType_encodedSequence_);
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInteger:self->_type forKey:@"Type"];
  encodedSequence = self->_encodedSequence;

  [a3 encodeObject:encodedSequence forKey:@"EncodedSequence"];
}

- (unint64_t)type
{
  return self->_type;
}

@end