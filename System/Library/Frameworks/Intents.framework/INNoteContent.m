@interface INNoteContent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INNoteContent)initWithCoder:(id)a3;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
@end

@implementation INNoteContent

- (id)_intents_cacheableObjects
{
  return 0;
}

- (id)_dictionaryRepresentation
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INNoteContent;
  v6 = [(INNoteContent *)&v11 description];
  v7 = [(INNoteContent *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INNoteContent *)self descriptionAtIndent:0];
}

- (INNoteContent)initWithCoder:(id)a3
{
  v4 = (INNoteContent *)objc_alloc_init((Class)objc_opt_class());

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  return 0;
}

- (unint64_t)hash
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end