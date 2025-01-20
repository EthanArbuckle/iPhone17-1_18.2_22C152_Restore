@interface CTDataStatusBasic
+ (BOOL)supportsSecureCoding;
- (BOOL)attached;
- (BOOL)cellularDataPossible;
- (BOOL)hasIndicator;
- (BOOL)inHomeCountry;
- (BOOL)newRadioCoverage;
- (BOOL)roamAllowed;
- (CTDataStatusBasic)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAttached:(BOOL)a3;
- (void)setCellularDataPossible:(BOOL)a3;
- (void)setHasIndicator:(BOOL)a3;
- (void)setInHomeCountry:(BOOL)a3;
- (void)setNewRadioCoverage:(BOOL)a3;
- (void)setRoamAllowed:(BOOL)a3;
@end

@implementation CTDataStatusBasic

- (BOOL)hasIndicator
{
  return self->_hasIndicator;
}

- (BOOL)cellularDataPossible
{
  return self->_cellularDataPossible;
}

- (void)setRoamAllowed:(BOOL)a3
{
  self->_roamAllowed = a3;
}

- (void)setNewRadioCoverage:(BOOL)a3
{
  self->_newRadioCoverage = a3;
}

- (void)setInHomeCountry:(BOOL)a3
{
  self->_inHomeCountry = a3;
}

- (void)setHasIndicator:(BOOL)a3
{
  self->_hasIndicator = a3;
}

- (void)setCellularDataPossible:(BOOL)a3
{
  self->_cellularDataPossible = a3;
}

- (void)setAttached:(BOOL)a3
{
  self->_attached = a3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", attached=%d", -[CTDataStatusBasic attached](self, "attached")];
  [v3 appendFormat:@", hasIndicator=%d", -[CTDataStatusBasic hasIndicator](self, "hasIndicator")];
  [v3 appendFormat:@", inHomeCountry=%d", -[CTDataStatusBasic inHomeCountry](self, "inHomeCountry")];
  [v3 appendFormat:@", roamAllowed=%d", -[CTDataStatusBasic roamAllowed](self, "roamAllowed")];
  [v3 appendFormat:@", cellularDataPossible=%d", -[CTDataStatusBasic cellularDataPossible](self, "cellularDataPossible")];
  [v3 appendFormat:@", newRadioCoverage=%d", -[CTDataStatusBasic newRadioCoverage](self, "newRadioCoverage")];
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setAttached:", -[CTDataStatusBasic attached](self, "attached"));
  objc_msgSend(v4, "setHasIndicator:", -[CTDataStatusBasic hasIndicator](self, "hasIndicator"));
  objc_msgSend(v4, "setInHomeCountry:", -[CTDataStatusBasic inHomeCountry](self, "inHomeCountry"));
  objc_msgSend(v4, "setRoamAllowed:", -[CTDataStatusBasic roamAllowed](self, "roamAllowed"));
  objc_msgSend(v4, "setCellularDataPossible:", -[CTDataStatusBasic cellularDataPossible](self, "cellularDataPossible"));
  objc_msgSend(v4, "setNewRadioCoverage:", -[CTDataStatusBasic newRadioCoverage](self, "newRadioCoverage"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  unsigned int v4 = [(CTDataStatusBasic *)self attached];
  if ([(CTDataStatusBasic *)self hasIndicator]) {
    v4 |= 2u;
  }
  if ([(CTDataStatusBasic *)self inHomeCountry]) {
    v4 |= 4u;
  }
  if ([(CTDataStatusBasic *)self roamAllowed]) {
    v4 |= 8u;
  }
  if ([(CTDataStatusBasic *)self cellularDataPossible]) {
    v4 |= 0x10u;
  }
  if ([(CTDataStatusBasic *)self newRadioCoverage]) {
    uint64_t v5 = v4 | 0x20;
  }
  else {
    uint64_t v5 = v4;
  }
  [v6 encodeInt:v5 forKey:@"DataStatusFlags"];
}

- (CTDataStatusBasic)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTDataStatusBasic;
  uint64_t v5 = [(CTDataStatusBasic *)&v9 init];
  if (v5)
  {
    unsigned int v6 = [v4 decodeIntForKey:@"DataStatusFlags"];
    v5[8] = v6 & 1;
    v7.i64[0] = *(void *)&vshl_u16((uint16x4_t)(*(void *)&vdup_n_s16(v6) & 0xFF00FF00FF00FFLL), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL) & 0xFF01FF01FF01FF01;
    *(_DWORD *)(v5 + 9) = vmovn_s16(v7).u32[0];
    v5[13] = (v6 & 0x20) != 0;
  }

  return (CTDataStatusBasic *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)attached
{
  return self->_attached;
}

- (BOOL)inHomeCountry
{
  return self->_inHomeCountry;
}

- (BOOL)roamAllowed
{
  return self->_roamAllowed;
}

- (BOOL)newRadioCoverage
{
  return self->_newRadioCoverage;
}

@end