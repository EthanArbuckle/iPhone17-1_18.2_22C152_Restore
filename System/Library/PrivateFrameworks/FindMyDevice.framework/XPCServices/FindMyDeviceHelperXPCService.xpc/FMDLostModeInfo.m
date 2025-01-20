@interface FMDLostModeInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)disableSlideToUnlock;
- (BOOL)facetimeCapable;
- (BOOL)lostModeEnabled;
- (FMDLostModeInfo)initWithCoder:(id)a3;
- (NSString)footnoteText;
- (NSString)message;
- (NSString)phoneNumber;
- (id)description;
- (unint64_t)lostModeType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDisableSlideToUnlock:(BOOL)a3;
- (void)setFacetimeCapable:(BOOL)a3;
- (void)setFootnoteText:(id)a3;
- (void)setLostModeEnabled:(BOOL)a3;
- (void)setLostModeType:(unint64_t)a3;
- (void)setMessage:(id)a3;
- (void)setPhoneNumber:(id)a3;
@end

@implementation FMDLostModeInfo

- (void)dealloc
{
  [(FMDLostModeInfo *)self setMessage:0];
  [(FMDLostModeInfo *)self setPhoneNumber:0];
  v3.receiver = self;
  v3.super_class = (Class)FMDLostModeInfo;
  [(FMDLostModeInfo *)&v3 dealloc];
}

- (FMDLostModeInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FMDLostModeInfo;
  v5 = [(FMDLostModeInfo *)&v14 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lostModeEnabled"];
    -[FMDLostModeInfo setLostModeEnabled:](v5, "setLostModeEnabled:", [v6 BOOLValue]);

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"disableSlideToUnlock"];
    -[FMDLostModeInfo setDisableSlideToUnlock:](v5, "setDisableSlideToUnlock:", [v7 BOOLValue]);

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    [(FMDLostModeInfo *)v5 setMessage:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
    [(FMDLostModeInfo *)v5 setPhoneNumber:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"facetimeCapable"];
    -[FMDLostModeInfo setFacetimeCapable:](v5, "setFacetimeCapable:", [v10 BOOLValue]);

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"footnoteText"];
    [(FMDLostModeInfo *)v5 setFootnoteText:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lostModeType"];
    -[FMDLostModeInfo setLostModeType:](v5, "setLostModeType:", [v12 unsignedIntegerValue]);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = +[NSNumber numberWithBool:[(FMDLostModeInfo *)self lostModeEnabled]];
  [v4 encodeObject:v5 forKey:@"lostModeEnabled"];

  v6 = +[NSNumber numberWithBool:[(FMDLostModeInfo *)self disableSlideToUnlock]];
  [v4 encodeObject:v6 forKey:@"disableSlideToUnlock"];

  v7 = [(FMDLostModeInfo *)self message];
  [v4 encodeObject:v7 forKey:@"message"];

  v8 = [(FMDLostModeInfo *)self phoneNumber];
  [v4 encodeObject:v8 forKey:@"phoneNumber"];

  v9 = +[NSNumber numberWithBool:[(FMDLostModeInfo *)self facetimeCapable]];
  [v4 encodeObject:v9 forKey:@"facetimeCapable"];

  v10 = [(FMDLostModeInfo *)self footnoteText];
  [v4 encodeObject:v10 forKey:@"footnoteText"];

  id v11 = +[NSNumber numberWithUnsignedInteger:[(FMDLostModeInfo *)self lostModeType]];
  [v4 encodeObject:v11 forKey:@"lostModeType"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  objc_super v3 = [(FMDLostModeInfo *)self message];
  id v4 = [(FMDLostModeInfo *)self phoneNumber];
  unsigned int v5 = [(FMDLostModeInfo *)self facetimeCapable];
  v6 = [(FMDLostModeInfo *)self footnoteText];
  v7 = +[NSString stringWithFormat:@"FMDLostModeInfo(0x%lx) message - %@, phoneNum - %@, facetimeCapable - %d, footnote - %@, inLostMode - %d, disableUnlock - %d, type - %ld", self, v3, v4, v5, v6, [(FMDLostModeInfo *)self lostModeEnabled], [(FMDLostModeInfo *)self disableSlideToUnlock], [(FMDLostModeInfo *)self lostModeType]];

  return v7;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (BOOL)lostModeEnabled
{
  return self->_lostModeEnabled;
}

- (void)setLostModeEnabled:(BOOL)a3
{
  self->_lostModeEnabled = a3;
}

- (unint64_t)lostModeType
{
  return self->_lostModeType;
}

- (void)setLostModeType:(unint64_t)a3
{
  self->_lostModeType = a3;
}

- (BOOL)disableSlideToUnlock
{
  return self->_disableSlideToUnlock;
}

- (void)setDisableSlideToUnlock:(BOOL)a3
{
  self->_disableSlideToUnlock = a3;
}

- (BOOL)facetimeCapable
{
  return self->_facetimeCapable;
}

- (void)setFacetimeCapable:(BOOL)a3
{
  self->_facetimeCapable = a3;
}

- (NSString)footnoteText
{
  return self->_footnoteText;
}

- (void)setFootnoteText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footnoteText, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end