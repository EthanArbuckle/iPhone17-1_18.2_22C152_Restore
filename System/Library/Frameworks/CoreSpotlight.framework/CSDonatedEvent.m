@interface CSDonatedEvent
+ (id)eventFromData:(id)a3;
- (BOOL)fromAllowListedSender;
- (BOOL)senderIsCourier;
- (CSDonatedEvent)initWithAttributes:(id)a3;
- (CSDonatedEvent)initWithData:(id)a3;
- (CSDonatedEvent)initWithType:(id)a3;
- (NSArray)docIDs;
- (NSDictionary)additionalInfo;
- (NSDictionary)attributes;
- (NSMutableDictionary)mutableAttributes;
- (NSString)type;
- (id)arrivalAirportCode;
- (id)arrivalAirportName;
- (id)arrivalDateTime;
- (id)arrivalTerminal;
- (id)bookingInfoUrl;
- (id)checkInUrl;
- (id)confirmationNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)courierName;
- (id)data;
- (id)deliveryDateTime;
- (id)departureAirportCode;
- (id)departureAirportName;
- (id)departureDateTime;
- (id)departureTerminal;
- (id)description;
- (id)flightCarrier;
- (id)flightNumber;
- (id)flightStatus;
- (id)merchantName;
- (id)orderDateTime;
- (id)trackingNumber;
- (id)trackingUrl;
- (void)setAdditionalInfo:(id)a3;
- (void)setArrivalAirportCode:(id)a3;
- (void)setArrivalAirportName:(id)a3;
- (void)setArrivalDateTime:(id)a3;
- (void)setArrivalTerminal:(id)a3;
- (void)setBookingInfoUrl:(id)a3;
- (void)setCheckInUrl:(id)a3;
- (void)setConfirmationNumber:(id)a3;
- (void)setCourierName:(id)a3;
- (void)setDeliveryDateTime:(id)a3;
- (void)setDepartureAirportCode:(id)a3;
- (void)setDepartureAirportName:(id)a3;
- (void)setDepartureDateTime:(id)a3;
- (void)setDepartureTerminal:(id)a3;
- (void)setDocIDs:(id)a3;
- (void)setFlightCarrier:(id)a3;
- (void)setFlightNumber:(id)a3;
- (void)setFlightStatus:(id)a3;
- (void)setFromAllowListedSender:(BOOL)a3;
- (void)setMerchantName:(id)a3;
- (void)setMutableAttributes:(id)a3;
- (void)setOrderDateTime:(id)a3;
- (void)setSenderIsCourier:(BOOL)a3;
- (void)setTrackingNumber:(id)a3;
- (void)setTrackingUrl:(id)a3;
- (void)setType:(id)a3;
@end

@implementation CSDonatedEvent

- (CSDonatedEvent)initWithType:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"type";
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  v7 = [(CSDonatedEvent *)self initWithAttributes:v6];
  return v7;
}

- (CSDonatedEvent)initWithAttributes:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSDonatedEvent;
  id v5 = [(CSDonatedEvent *)&v8 init];
  if (v5)
  {
    v6 = (void *)[v4 mutableCopy];
    [(CSDonatedEvent *)v5 setMutableAttributes:v6];
  }
  return v5;
}

- (CSDonatedEvent)initWithData:(id)a3
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v9 = 0;
  v10[0] = 0;
  id v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:v10 error:&v9];
  id v6 = v9;
  if (v6) {
    v7 = 0;
  }
  else {
    v7 = [[CSDonatedEvent alloc] initWithAttributes:v5];
  }

  return v7;
}

- (id)data
{
  v2 = (void *)MEMORY[0x1E4F28F98];
  v3 = [(CSDonatedEvent *)self attributes];
  id v7 = 0;
  id v4 = [v2 dataWithPropertyList:v3 format:200 options:0 error:&v7];
  id v5 = v7;

  if (v5)
  {

    id v4 = 0;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(CSDonatedEvent *)self attributes];
  id v6 = (void *)[v4 initWithAttributes:v5];

  return v6;
}

- (NSDictionary)attributes
{
  v2 = [(CSDonatedEvent *)self mutableAttributes];
  v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CSDonatedEvent *)self mutableAttributes];
  id v6 = [v5 description];
  id v7 = [v3 stringWithFormat:@"<%@:%p, %@>", v4, self, v6];

  return v7;
}

+ (id)eventFromData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[CSDonatedEvent alloc] initWithData:v3];

  return v4;
}

- (void)setType:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDonatedEvent *)self mutableAttributes];
  [v5 setValue:v4 forKey:@"type"];
}

- (NSString)type
{
  v2 = [(CSDonatedEvent *)self mutableAttributes];
  id v3 = [v2 valueForKey:@"type"];

  return (NSString *)v3;
}

- (void)setAdditionalInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDonatedEvent *)self mutableAttributes];
  [v5 setValue:v4 forKey:@"additionalInfo"];
}

- (NSDictionary)additionalInfo
{
  v2 = [(CSDonatedEvent *)self mutableAttributes];
  id v3 = [v2 valueForKey:@"additionalInfo"];

  return (NSDictionary *)v3;
}

- (void)setDocIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDonatedEvent *)self mutableAttributes];
  [v5 setValue:v4 forKey:@"docIDs"];
}

- (NSArray)docIDs
{
  v2 = [(CSDonatedEvent *)self mutableAttributes];
  id v3 = [v2 valueForKey:@"docIDs"];

  return (NSArray *)v3;
}

- (void)setFlightNumber:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDonatedEvent *)self mutableAttributes];
  [v5 setValue:v4 forKey:@"flightNumber"];
}

- (id)flightNumber
{
  v2 = [(CSDonatedEvent *)self mutableAttributes];
  id v3 = [v2 valueForKey:@"flightNumber"];

  return v3;
}

- (void)setFlightCarrier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDonatedEvent *)self mutableAttributes];
  [v5 setValue:v4 forKey:@"flightCarrier"];
}

- (id)flightCarrier
{
  v2 = [(CSDonatedEvent *)self mutableAttributes];
  id v3 = [v2 valueForKey:@"flightCarrier"];

  return v3;
}

- (void)setFlightStatus:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDonatedEvent *)self mutableAttributes];
  [v5 setValue:v4 forKey:@"flightStatus"];
}

- (id)flightStatus
{
  v2 = [(CSDonatedEvent *)self mutableAttributes];
  id v3 = [v2 valueForKey:@"flightStatus"];

  return v3;
}

- (void)setCheckInUrl:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDonatedEvent *)self mutableAttributes];
  [v5 setValue:v4 forKey:@"checkInUrl"];
}

- (id)checkInUrl
{
  v2 = [(CSDonatedEvent *)self mutableAttributes];
  id v3 = [v2 valueForKey:@"checkInUrl"];

  return v3;
}

- (void)setBookingInfoUrl:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDonatedEvent *)self mutableAttributes];
  [v5 setValue:v4 forKey:@"bookingInfoUrl"];
}

- (id)bookingInfoUrl
{
  v2 = [(CSDonatedEvent *)self mutableAttributes];
  id v3 = [v2 valueForKey:@"bookingInfoUrl"];

  return v3;
}

- (void)setArrivalAirportCode:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDonatedEvent *)self mutableAttributes];
  [v5 setValue:v4 forKey:@"arrivalAirportCode"];
}

- (id)arrivalAirportCode
{
  v2 = [(CSDonatedEvent *)self mutableAttributes];
  id v3 = [v2 valueForKey:@"arrivalAirportCode"];

  return v3;
}

- (void)setDepartureAirportCode:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDonatedEvent *)self mutableAttributes];
  [v5 setValue:v4 forKey:@"departureAirportCode"];
}

- (id)departureAirportCode
{
  v2 = [(CSDonatedEvent *)self mutableAttributes];
  id v3 = [v2 valueForKey:@"departureAirportCode"];

  return v3;
}

- (void)setArrivalAirportName:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDonatedEvent *)self mutableAttributes];
  [v5 setValue:v4 forKey:@"arrivalAirportName"];
}

- (id)arrivalAirportName
{
  v2 = [(CSDonatedEvent *)self mutableAttributes];
  id v3 = [v2 valueForKey:@"arrivalAirportName"];

  return v3;
}

- (void)setDepartureAirportName:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDonatedEvent *)self mutableAttributes];
  [v5 setValue:v4 forKey:@"departureAirportName"];
}

- (id)departureAirportName
{
  v2 = [(CSDonatedEvent *)self mutableAttributes];
  id v3 = [v2 valueForKey:@"departureAirportName"];

  return v3;
}

- (void)setArrivalTerminal:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDonatedEvent *)self mutableAttributes];
  [v5 setValue:v4 forKey:@"arrivalTerminal"];
}

- (id)arrivalTerminal
{
  v2 = [(CSDonatedEvent *)self mutableAttributes];
  id v3 = [v2 valueForKey:@"arrivalTerminal"];

  return v3;
}

- (void)setDepartureTerminal:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDonatedEvent *)self mutableAttributes];
  [v5 setValue:v4 forKey:@"departureTerminal"];
}

- (id)departureTerminal
{
  v2 = [(CSDonatedEvent *)self mutableAttributes];
  id v3 = [v2 valueForKey:@"departureTerminal"];

  return v3;
}

- (void)setArrivalDateTime:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDonatedEvent *)self mutableAttributes];
  [v5 setValue:v4 forKey:@"arrivalDateTime"];
}

- (id)arrivalDateTime
{
  v2 = [(CSDonatedEvent *)self mutableAttributes];
  id v3 = [v2 valueForKey:@"arrivalDateTime"];

  return v3;
}

- (void)setDepartureDateTime:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDonatedEvent *)self mutableAttributes];
  [v5 setValue:v4 forKey:@"departureDateTime"];
}

- (id)departureDateTime
{
  v2 = [(CSDonatedEvent *)self mutableAttributes];
  id v3 = [v2 valueForKey:@"departureDateTime"];

  return v3;
}

- (void)setConfirmationNumber:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDonatedEvent *)self mutableAttributes];
  [v5 setValue:v4 forKey:@"confirmationNumber"];
}

- (id)confirmationNumber
{
  v2 = [(CSDonatedEvent *)self mutableAttributes];
  id v3 = [v2 valueForKey:@"confirmationNumber"];

  return v3;
}

- (void)setTrackingUrl:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDonatedEvent *)self mutableAttributes];
  [v5 setValue:v4 forKey:@"trackingUrl"];
}

- (id)trackingUrl
{
  v2 = [(CSDonatedEvent *)self mutableAttributes];
  id v3 = [v2 valueForKey:@"trackingUrl"];

  return v3;
}

- (void)setTrackingNumber:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDonatedEvent *)self mutableAttributes];
  [v5 setValue:v4 forKey:@"trackingNumber"];
}

- (id)trackingNumber
{
  v2 = [(CSDonatedEvent *)self mutableAttributes];
  id v3 = [v2 valueForKey:@"trackingNumber"];

  return v3;
}

- (void)setOrderDateTime:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDonatedEvent *)self mutableAttributes];
  [v5 setValue:v4 forKey:@"orderDateTime"];
}

- (id)orderDateTime
{
  v2 = [(CSDonatedEvent *)self mutableAttributes];
  id v3 = [v2 valueForKey:@"orderDateTime"];

  return v3;
}

- (void)setDeliveryDateTime:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDonatedEvent *)self mutableAttributes];
  [v5 setValue:v4 forKey:@"deliveryDateTime"];
}

- (id)deliveryDateTime
{
  v2 = [(CSDonatedEvent *)self mutableAttributes];
  id v3 = [v2 valueForKey:@"deliveryDateTime"];

  return v3;
}

- (void)setCourierName:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDonatedEvent *)self mutableAttributes];
  [v5 setValue:v4 forKey:@"courierName"];
}

- (id)courierName
{
  v2 = [(CSDonatedEvent *)self mutableAttributes];
  id v3 = [v2 valueForKey:@"courierName"];

  return v3;
}

- (void)setMerchantName:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDonatedEvent *)self mutableAttributes];
  [v5 setValue:v4 forKey:@"merchantName"];
}

- (id)merchantName
{
  v2 = [(CSDonatedEvent *)self mutableAttributes];
  id v3 = [v2 valueForKey:@"merchantName"];

  return v3;
}

- (void)setSenderIsCourier:(BOOL)a3
{
  mutableAttributes = self->_mutableAttributes;
  id v4 = [NSNumber numberWithBool:a3];
  [(NSMutableDictionary *)mutableAttributes setValue:v4 forKey:@"senderIsCourier"];
}

- (BOOL)senderIsCourier
{
  v2 = [(NSMutableDictionary *)self->_mutableAttributes valueForKey:@"senderIsCourier"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setFromAllowListedSender:(BOOL)a3
{
  mutableAttributes = self->_mutableAttributes;
  id v4 = [NSNumber numberWithBool:a3];
  [(NSMutableDictionary *)mutableAttributes setValue:v4 forKey:@"fromAllowListedSender"];
}

- (BOOL)fromAllowListedSender
{
  v2 = [(NSMutableDictionary *)self->_mutableAttributes valueForKey:@"fromAllowListedSender"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSMutableDictionary)mutableAttributes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMutableAttributes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end