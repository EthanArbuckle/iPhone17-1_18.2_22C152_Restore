@interface GEOInlineRapEnablement
- (BOOL)isAddressEditable;
- (BOOL)isEditable;
- (BOOL)isHoursEditable;
- (BOOL)isPhoneEditable;
- (BOOL)isWebsiteEditable;
- (GEOInlineRapEnablement)initWithEnablement:(id)a3;
@end

@implementation GEOInlineRapEnablement

- (GEOInlineRapEnablement)initWithEnablement:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOInlineRapEnablement;
    v6 = [(GEOInlineRapEnablement *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_inlineRapEnablement, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEditable
{
  if ([(GEOInlineRapEnablement *)self isHoursEditable]
    || [(GEOInlineRapEnablement *)self isPhoneEditable]
    || [(GEOInlineRapEnablement *)self isWebsiteEditable])
  {
    return 1;
  }

  return [(GEOInlineRapEnablement *)self isAddressEditable];
}

- (BOOL)isHoursEditable
{
  if (![(GEOPDInlineRapEnablement *)self->_inlineRapEnablement hasIsHoursEditable]) {
    return 1;
  }
  inlineRapEnablement = self->_inlineRapEnablement;

  return [(GEOPDInlineRapEnablement *)inlineRapEnablement isHoursEditable];
}

- (BOOL)isPhoneEditable
{
  if (![(GEOPDInlineRapEnablement *)self->_inlineRapEnablement hasIsPhoneEditable]) {
    return 1;
  }
  inlineRapEnablement = self->_inlineRapEnablement;

  return [(GEOPDInlineRapEnablement *)inlineRapEnablement isPhoneEditable];
}

- (BOOL)isWebsiteEditable
{
  if (![(GEOPDInlineRapEnablement *)self->_inlineRapEnablement hasIsWebsiteEditable]) {
    return 1;
  }
  inlineRapEnablement = self->_inlineRapEnablement;

  return [(GEOPDInlineRapEnablement *)inlineRapEnablement isWebsiteEditable];
}

- (BOOL)isAddressEditable
{
  if (![(GEOPDInlineRapEnablement *)self->_inlineRapEnablement hasIsAddressEditable]) {
    return 1;
  }
  inlineRapEnablement = self->_inlineRapEnablement;

  return [(GEOPDInlineRapEnablement *)inlineRapEnablement isAddressEditable];
}

- (void).cxx_destruct
{
}

@end