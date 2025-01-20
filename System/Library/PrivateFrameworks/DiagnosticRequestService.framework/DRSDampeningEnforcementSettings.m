@interface DRSDampeningEnforcementSettings
- (BOOL)enforcesResourceCap;
- (BOOL)enforcesResourceDownsampling;
- (BOOL)enforcesResourceHysteresis;
- (BOOL)enforcesSignatureCap;
- (BOOL)enforcesSignatureDownsampling;
- (BOOL)enforcesSignatureHysteresis;
- (BOOL)enforcesTotalCap;
- (BOOL)isEqual:(id)a3;
- (DRSDampeningEnforcementSettings)init;
- (DRSDampeningEnforcementSettings)initWithMO:(id)a3;
- (id)_moRepresentation:(id)a3;
- (id)debugDescription;
- (id)jsonCompatibleDictRepresentation;
- (void)setAllEnforcement:(BOOL)a3;
- (void)setEnforcesResourceCap:(BOOL)a3;
- (void)setEnforcesResourceDownsampling:(BOOL)a3;
- (void)setEnforcesResourceHysteresis:(BOOL)a3;
- (void)setEnforcesSignatureCap:(BOOL)a3;
- (void)setEnforcesSignatureDownsampling:(BOOL)a3;
- (void)setEnforcesSignatureHysteresis:(BOOL)a3;
- (void)setEnforcesTotalCap:(BOOL)a3;
@end

@implementation DRSDampeningEnforcementSettings

- (DRSDampeningEnforcementSettings)init
{
  v3.receiver = self;
  v3.super_class = (Class)DRSDampeningEnforcementSettings;
  result = [(DRSDampeningEnforcementSettings *)&v3 init];
  if (result)
  {
    *(_DWORD *)&result->_enforcesSignatureHysteresis = 16843009;
    *(_DWORD *)&result->_enforcesResourceHysteresis = 16843009;
  }
  return result;
}

- (id)jsonCompatibleDictRepresentation
{
  v13[7] = *MEMORY[0x263EF8340];
  v12[0] = @"EnforceResourceHysteresis";
  objc_super v3 = objc_msgSend(NSNumber, "numberWithBool:", -[DRSDampeningEnforcementSettings enforcesResourceHysteresis](self, "enforcesResourceHysteresis"));
  v13[0] = v3;
  v12[1] = @"EnforceResourceCap";
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[DRSDampeningEnforcementSettings enforcesResourceCap](self, "enforcesResourceCap"));
  v13[1] = v4;
  v12[2] = @"EnforceResourceDownsampling";
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[DRSDampeningEnforcementSettings enforcesResourceDownsampling](self, "enforcesResourceDownsampling"));
  v13[2] = v5;
  v12[3] = @"EnforceSignatureHysteresis";
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[DRSDampeningEnforcementSettings enforcesSignatureHysteresis](self, "enforcesSignatureHysteresis"));
  v13[3] = v6;
  v12[4] = @"EnforceSignatureCap";
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[DRSDampeningEnforcementSettings enforcesSignatureCap](self, "enforcesSignatureCap"));
  v13[4] = v7;
  v12[5] = @"EnforceSignatureDownsampling";
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[DRSDampeningEnforcementSettings enforcesSignatureDownsampling](self, "enforcesSignatureDownsampling"));
  v13[5] = v8;
  v12[6] = @"EnforceTotalCap";
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[DRSDampeningEnforcementSettings enforcesTotalCap](self, "enforcesTotalCap"));
  v13[6] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:7];

  return v10;
}

- (void)setAllEnforcement:(BOOL)a3
{
  BOOL v3 = a3;
  -[DRSDampeningEnforcementSettings setEnforcesResourceHysteresis:](self, "setEnforcesResourceHysteresis:");
  [(DRSDampeningEnforcementSettings *)self setEnforcesResourceCap:v3];
  [(DRSDampeningEnforcementSettings *)self setEnforcesResourceDownsampling:v3];
  [(DRSDampeningEnforcementSettings *)self setEnforcesSignatureHysteresis:v3];
  [(DRSDampeningEnforcementSettings *)self setEnforcesSignatureCap:v3];
  [(DRSDampeningEnforcementSettings *)self setEnforcesSignatureDownsampling:v3];

  [(DRSDampeningEnforcementSettings *)self setEnforcesTotalCap:v3];
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  if ([(DRSDampeningEnforcementSettings *)self enforcesResourceHysteresis]) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  if ([(DRSDampeningEnforcementSettings *)self enforcesResourceCap]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  if ([(DRSDampeningEnforcementSettings *)self enforcesResourceDownsampling]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  if ([(DRSDampeningEnforcementSettings *)self enforcesSignatureHysteresis]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  if ([(DRSDampeningEnforcementSettings *)self enforcesSignatureCap]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  if ([(DRSDampeningEnforcementSettings *)self enforcesSignatureDownsampling]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  if ([(DRSDampeningEnforcementSettings *)self enforcesTotalCap]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  v11 = (void *)[v3 initWithFormat:@"\t%@ -> %@\n\t%@ -> %@\n\t%@ -> %@\n\t%@ -> %@\n\t%@ -> %@\n\t%@ -> %@\n\t%@ -> %@\n", @"enforcesResourceHysteresis", v4, @"enforcesResourceCap", v5, @"enforcesResourceDownsampling", v6, @"enforcesSignatureHysteresis", v7, @"enforcesSignatureCap", v8, @"enforcesSignatureDownsampling", v9, @"enforcesTotalCap", v10];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DRSDampeningEnforcementSettings *)a3;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(DRSDampeningEnforcementSettings *)self enforcesResourceHysteresis];
      if (v6 == [(DRSDampeningEnforcementSettings *)v5 enforcesResourceHysteresis]
        && (BOOL v7 = [(DRSDampeningEnforcementSettings *)self enforcesResourceCap],
            v7 == [(DRSDampeningEnforcementSettings *)v5 enforcesResourceCap])
        && (BOOL v8 = [(DRSDampeningEnforcementSettings *)self enforcesResourceDownsampling],
            v8 == [(DRSDampeningEnforcementSettings *)v5 enforcesResourceDownsampling])
        && (BOOL v9 = [(DRSDampeningEnforcementSettings *)self enforcesSignatureHysteresis],
            v9 == [(DRSDampeningEnforcementSettings *)v5 enforcesSignatureHysteresis])
        && (BOOL v10 = [(DRSDampeningEnforcementSettings *)self enforcesSignatureCap],
            v10 == [(DRSDampeningEnforcementSettings *)v5 enforcesSignatureCap])
        && (BOOL v11 = [(DRSDampeningEnforcementSettings *)self enforcesSignatureDownsampling], v11 == [(DRSDampeningEnforcementSettings *)v5 enforcesSignatureDownsampling]))
      {
        BOOL v14 = [(DRSDampeningEnforcementSettings *)self enforcesTotalCap];
        BOOL v12 = v14 ^ [(DRSDampeningEnforcementSettings *)v5 enforcesTotalCap] ^ 1;
      }
      else
      {
        LOBYTE(v12) = 0;
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }

  return v12;
}

- (DRSDampeningEnforcementSettings)initWithMO:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DRSDampeningEnforcementSettings;
  v5 = [(DRSDampeningEnforcementSettings *)&v7 init];
  if (v5)
  {
    v5->_enforcesResourceHysteresis = [v4 enforcesResourceHysteresis];
    v5->_enforcesResourceCap = [v4 enforcesResourceCap];
    v5->_enforcesResourceDownsampling = [v4 enforcesResourceDownsampling];
    v5->_enforcesSignatureHysteresis = [v4 enforcesSignatureHysteresis];
    v5->_enforcesSignatureCap = [v4 enforcesSignatureCap];
    v5->_enforcesSignatureDownsampling = [v4 enforcesSignatureDownsampling];
    v5->_enforcesTotalCap = [v4 enforcesTotalCap];
  }

  return v5;
}

- (id)_moRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [[DRSDampeningEnforcementSettingsMO alloc] initWithContext:v4];

  [(DRSDampeningEnforcementSettingsMO *)v5 setEnforcesResourceHysteresis:[(DRSDampeningEnforcementSettings *)self enforcesResourceHysteresis]];
  [(DRSDampeningEnforcementSettingsMO *)v5 setEnforcesResourceCap:[(DRSDampeningEnforcementSettings *)self enforcesResourceCap]];
  [(DRSDampeningEnforcementSettingsMO *)v5 setEnforcesResourceDownsampling:[(DRSDampeningEnforcementSettings *)self enforcesResourceDownsampling]];
  [(DRSDampeningEnforcementSettingsMO *)v5 setEnforcesSignatureHysteresis:[(DRSDampeningEnforcementSettings *)self enforcesSignatureHysteresis]];
  [(DRSDampeningEnforcementSettingsMO *)v5 setEnforcesSignatureCap:[(DRSDampeningEnforcementSettings *)self enforcesSignatureCap]];
  [(DRSDampeningEnforcementSettingsMO *)v5 setEnforcesSignatureDownsampling:[(DRSDampeningEnforcementSettings *)self enforcesSignatureDownsampling]];
  [(DRSDampeningEnforcementSettingsMO *)v5 setEnforcesTotalCap:[(DRSDampeningEnforcementSettings *)self enforcesTotalCap]];

  return v5;
}

- (BOOL)enforcesResourceHysteresis
{
  return self->_enforcesResourceHysteresis;
}

- (void)setEnforcesResourceHysteresis:(BOOL)a3
{
  self->_enforcesResourceHysteresis = a3;
}

- (BOOL)enforcesResourceCap
{
  return self->_enforcesResourceCap;
}

- (void)setEnforcesResourceCap:(BOOL)a3
{
  self->_enforcesResourceCap = a3;
}

- (BOOL)enforcesResourceDownsampling
{
  return self->_enforcesResourceDownsampling;
}

- (void)setEnforcesResourceDownsampling:(BOOL)a3
{
  self->_enforcesResourceDownsampling = a3;
}

- (BOOL)enforcesSignatureHysteresis
{
  return self->_enforcesSignatureHysteresis;
}

- (void)setEnforcesSignatureHysteresis:(BOOL)a3
{
  self->_enforcesSignatureHysteresis = a3;
}

- (BOOL)enforcesSignatureCap
{
  return self->_enforcesSignatureCap;
}

- (void)setEnforcesSignatureCap:(BOOL)a3
{
  self->_enforcesSignatureCap = a3;
}

- (BOOL)enforcesSignatureDownsampling
{
  return self->_enforcesSignatureDownsampling;
}

- (void)setEnforcesSignatureDownsampling:(BOOL)a3
{
  self->_enforcesSignatureDownsampling = a3;
}

- (BOOL)enforcesTotalCap
{
  return self->_enforcesTotalCap;
}

- (void)setEnforcesTotalCap:(BOOL)a3
{
  self->_enforcesTotalCap = a3;
}

@end