@interface _GEOPhoneNumbersTicket
- ($C4D369C9F02205611300857CFD58F739)dataRequestKind;
- (_GEOPhoneNumbersTicket)initWithPhoneNumbers:(id)a3 allowCellularDataForLookup:(BOOL)a4 traits:(id)a5;
- (id)description;
- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6;
@end

@implementation _GEOPhoneNumbersTicket

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v9)
  {
    v12 = +[GEOPlaceCardRequester sharedRequester];
    phoneNumbers = self->_phoneNumbers;
    BOOL allowCellularDataForLookup = self->_allowCellularDataForLookup;
    traits = self->super.super._traits;
    throttlerToken = self->super.super._throttlerToken;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __79___GEOPhoneNumbersTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke;
    v18[3] = &unk_1E53DEA28;
    v18[4] = self;
    id v19 = v9;
    id v17 = (id)[v12 requestPhoneNumbers:phoneNumbers allowCellularDataForLookup:allowCellularDataForLookup traits:traits auditToken:v10 throttleToken:throttlerToken networkActivity:v11 requesterHandler:v18];
  }
}

- (_GEOPhoneNumbersTicket)initWithPhoneNumbers:(id)a3 allowCellularDataForLookup:(BOOL)a4 traits:(id)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_GEOPhoneNumbersTicket;
  id v9 = [(GEOAbstractTicket *)&v14 initWithTraits:a5];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    phoneNumbers = v9->_phoneNumbers;
    v9->_phoneNumbers = (NSArray *)v10;

    v9->_BOOL allowCellularDataForLookup = a4;
    v12 = v9;
  }

  return v9;
}

- (void).cxx_destruct
{
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_GEOPhoneNumbersTicket;
  v4 = [(GEOAbstractTicket *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ phonenumbers: %@", v4, self->_phoneNumbers];

  return v5;
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKind
{
  int v2 = [(GEOMapServiceTraits *)self->super.super._traits requestPriority];
  $C4D369C9F02205611300857CFD58F739 v3 = ($C4D369C9F02205611300857CFD58F739)0x1700000500;
  if (v2 != 1) {
    $C4D369C9F02205611300857CFD58F739 v3 = ($C4D369C9F02205611300857CFD58F739)0x1700000300;
  }
  if (v2 == 2) {
    return ($C4D369C9F02205611300857CFD58F739)0x1700000700;
  }
  else {
    return v3;
  }
}

@end