@interface _DPWordRecord
+ (BOOL)supportsSecureCoding;
+ (id)bogusCharacter;
+ (id)word:(id)a3 atPosition:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToWordRecord:(id)a3;
- (NSNumber)wordPosition;
- (NSString)word;
- (_DPWordRecord)init;
- (_DPWordRecord)initWithCoder:(id)a3;
- (_DPWordRecord)initWithWord:(id)a3 atPosition:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)sequenceWithoutPadding;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _DPWordRecord

- (_DPWordRecord)init
{
  return 0;
}

- (_DPWordRecord)initWithWord:(id)a3 atPosition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_DPWordRecord;
  v8 = [(_DPWordRecord *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_wordPosition, a4);
    uint64_t v10 = [v6 copy];
    word = v9->_word;
    v9->_word = (NSString *)v10;
  }
  return v9;
}

+ (id)word:(id)a3 atPosition:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithWord:v7 atPosition:v6];

  return v8;
}

+ (id)bogusCharacter
{
  return @"∅";
}

- (id)sequenceWithoutPadding
{
  v3 = [(_DPWordRecord *)self wordPosition];
  int v4 = [v3 isEqualToNumber:&unk_1F37A0340];

  if (v4)
  {
    v5 = [(_DPWordRecord *)self word];
    id v6 = [v5 componentsSeparatedByString:@"∅"];

    id v7 = [v6 objectAtIndexedSubscript:0];
    id v8 = 0;
    if (([v7 isEqualToString:&stru_1F3681BE0] & 1) == 0) {
      id v8 = v7;
    }
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DPWordRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wordPosition"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"word"];

  id v7 = [(_DPWordRecord *)self initWithWord:v6 atPosition:v5];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_DPWordRecord *)self wordPosition];
  [v4 encodeObject:v5 forKey:@"wordPosition"];

  id v6 = [(_DPWordRecord *)self word];
  [v4 encodeObject:v6 forKey:@"word"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(_DPWordRecord *)self wordPosition];
  id v7 = [(_DPWordRecord *)self word];
  id v8 = [v3 stringWithFormat:@"%@: { wordPosition=%@  word=%@ }", v5, v6, v7];;

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_class();
  v5 = [(_DPWordRecord *)self word];
  id v6 = [(_DPWordRecord *)self wordPosition];
  id v7 = [v4 word:v5 atPosition:v6];

  return v7;
}

- (BOOL)isEqualToWordRecord:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  v5 = [(_DPWordRecord *)self wordPosition];
  id v6 = [v4 wordPosition];
  char v7 = [v5 isEqualToNumber:v6];

  id v8 = [(_DPWordRecord *)self word];
  v9 = [v4 word];

  LOBYTE(v4) = [v8 isEqualToString:v9];
  return v7 & v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_DPWordRecord *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(_DPWordRecord *)self isEqualToWordRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(_DPWordRecord *)self word];
  uint64_t v4 = [v3 hash];
  v5 = [(_DPWordRecord *)self wordPosition];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSNumber)wordPosition
{
  return self->_wordPosition;
}

- (NSString)word
{
  return self->_word;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_word, 0);
  objc_storeStrong((id *)&self->_wordPosition, 0);
}

@end