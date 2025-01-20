@interface NSRubyAnnotation
+ (BOOL)supportsSecureCoding;
- (NSRubyAnnotation)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSRubyAnnotation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    if (self)
    {
LABEL_3:
      [a3 encodeInt:*(unsigned __int8 *)self[5].super.isa forKey:@"Alignment"];
      [a3 encodeInt:*((unsigned __int8 *)self[5].super.isa + 1) forKey:@"Overhang"];
      double v6 = *((double *)self[5].super.isa + 1);
      *(float *)&double v6 = v6;
      [a3 encodeFloat:@"SizeFactor" forKey:v6];
      [a3 encodeObject:*((void *)self[5].super.isa + 2) forKey:@"TextBefore"];
      [a3 encodeObject:*((void *)self[5].super.isa + 3) forKey:@"TextAfter"];
      [a3 encodeObject:*((void *)self[5].super.isa + 4) forKey:@"TextInterCharacter"];
      uint64_t v7 = *((void *)self[5].super.isa + 5);
      goto LABEL_4;
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRubyAnnotation.cpp", 33, @"Invalid parameter not satisfying: %@", @"[coder allowsKeyedCoding]");
    if (self) {
      goto LABEL_3;
    }
  }
  [a3 encodeInt:255 forKey:@"Alignment"];
  [a3 encodeInt:255 forKey:@"Overhang"];
  [a3 encodeFloat:@"SizeFactor" forKey:0.0];
  [a3 encodeObject:0 forKey:@"TextBefore"];
  [a3 encodeObject:0 forKey:@"TextAfter"];
  [a3 encodeObject:0 forKey:@"TextInterCharacter"];
  uint64_t v7 = 0;
LABEL_4:

  [a3 encodeObject:v7 forKey:@"TextInline"];
}

- (NSRubyAnnotation)initWithCoder:(id)a3
{
  v20[4] = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TRubyAnnotation.cpp", 47, @"Invalid parameter not satisfying: %@", @"[coder allowsKeyedCoding]");
  }
  v18.receiver = self;
  v18.super_class = (Class)NSRubyAnnotation;
  double v6 = [(NSRubyAnnotation *)&v18 init];
  char v7 = [a3 decodeIntForKey:@"Alignment"];
  char v8 = [a3 decodeIntForKey:@"Overhang"];
  [a3 decodeFloatForKey:@"SizeFactor"];
  float v10 = v9;
  v20[0] = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"TextBefore"];
  v20[1] = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"TextAfter"];
  v20[2] = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"TextInterCharacter"];
  v20[3] = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"TextInline"];
  id v17 = (id)0xAAAAAAAAAAAAAAAALL;
  uint64_t v11 = TCFBase<TRubyAnnotation>::Allocate();
  if (v11)
  {
    v12 = (char *)v11;
    uint64_t v13 = 0;
    *(unsigned char *)(v11 + 48) = v7;
    *(void *)(v11 + 16) = 0;
    *(void *)(v11 + 24) = TRubyAnnotation::Hash;
    *(void *)(v11 + 32) = 0;
    *(void *)(v11 + 40) = v11 + 48;
    *(unsigned char *)(v11 + 49) = v8;
    *(double *)(v11 + 56) = v10;
    *(unsigned char *)(v11 + 96) = 0;
    *(void *)(v11 + 104) = 0;
    *(void *)(v11 + 112) = 0;
    *(_WORD *)(v11 + 120) = 256;
    do
    {
      *(void *)&v12[v13 * 8 + 64] = (id)v20[v13];
      ++v13;
    }
    while (v13 != 4);
    id v19 = v12;
    id v16 = (id)atomic_exchange((atomic_ullong *volatile)&v19, 0);
  }
  else
  {
    id v16 = 0;
  }
  id v17 = (id)atomic_exchange((atomic_ullong *volatile)&v16, 0);

  v14 = (NSRubyAnnotation *)atomic_exchange((atomic_ullong *volatile)&v17, 0);
  return v14;
}

@end