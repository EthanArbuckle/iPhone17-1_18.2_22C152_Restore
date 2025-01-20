@interface PCPrinter
+ (id)printers;
- (BOOL)isAirPrint;
- (BOOL)isBonjour;
- (BOOL)isDirectConnect;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPCPrinter:(id)a3;
- (BOOL)isEqualToPKPrinter:(id)a3;
- (BOOL)isEqualToiCloudPrinter:(id)a3;
- (BOOL)isFavorite;
- (BOOL)isNearby;
- (BOOL)isOffline;
- (BOOL)isRemote;
- (BOOL)isiCloudPrinter;
- (BOOL)requiresAuthentication;
- (BOOL)supportsJobAccountID;
- (BOOL)update;
- (NSArray)classMembers;
- (NSArray)ppdStateReasons;
- (NSArray)printerStateReasons;
- (NSArray)supportedMimeTypes;
- (NSAttributedString)displayNameWithLocation;
- (NSData)thumbnailData;
- (NSDictionary)printerInfo;
- (NSString)_uuid;
- (NSString)displayName;
- (NSString)location;
- (NSString)makeAndModel;
- (NSString)name;
- (NSString)printerStateMessage;
- (NSString)uuid;
- (NSString)version;
- (NSURL)adminURL;
- (NSURL)helpBookURL;
- (NSURL)printerURL;
- (PCPrinter)initWithPKPrinter:(id)a3;
- (PCPrinter)initWithPrinterInfo:(id)a3;
- (id)authInfoRequired;
- (id)deviceURI;
- (id)printerLocalizedStateReason:(id)a3;
- (id)printerURI;
- (int64_t)category;
- (int64_t)displayCategory;
- (int64_t)jobAccountIDSupport;
- (int64_t)kind;
- (int64_t)pause;
- (int64_t)remove;
- (int64_t)resume;
- (int64_t)state;
- (unint64_t)jobTypesSupported;
- (void)dealloc;
- (void)setPrinterInfo:(id)a3;
- (void)setThumbnailData:(id)a3;
- (void)set_uuid:(id)a3;
@end

@implementation PCPrinter

- (PCPrinter)initWithPrinterInfo:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PCPrinter;
  id v3 = a3;
  v4 = [(PCPrinter *)&v7 init];
  -[PCPrinter setPrinterInfo:](v4, "setPrinterInfo:", v3, v7.receiver, v7.super_class);

  id v5 = +[PKDefaults iCloudPrinters];
  return v4;
}

- (PCPrinter)initWithPKPrinter:(id)a3
{
  v4 = [a3 browseInfo];
  v7.receiver = self;
  v7.super_class = (Class)PCPrinter;
  id v5 = (PCPrinter *)[(PCPrinter *)&v7 initPKPrinterWithBrowseInfo:v4];

  [(PCPrinter *)v5 setPrinterInfo:0];
  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PCPrinter;
  [(PCPrinter *)&v2 dealloc];
}

- (NSString)name
{
  id v3 = [(PCPrinter *)self printerInfo];

  if (v3)
  {
    v4 = [(PCPrinter *)self printerInfo];
    id v5 = [v4 objectForKeyedSubscript:@"printer-name"];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PCPrinter;
    id v5 = [(PCPrinter *)&v7 name];
  }

  return (NSString *)v5;
}

- (NSURL)printerURL
{
  id v3 = [(PCPrinter *)self printerInfo];

  if (v3)
  {
    v4 = [(PCPrinter *)self printerURI];
    id v5 = +[NSURL URLWithString:v4];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PCPrinter;
    id v5 = [(PCPrinter *)&v7 printerURL];
  }

  return (NSURL *)v5;
}

- (id)printerURI
{
  objc_super v2 = [(PCPrinter *)self printerInfo];
  id v3 = [v2 objectForKeyedSubscript:@"printer-uri-supported"];

  return v3;
}

- (id)deviceURI
{
  objc_super v2 = [(PCPrinter *)self printerInfo];
  id v3 = [v2 objectForKeyedSubscript:@"device-uri"];

  return v3;
}

- (NSString)uuid
{
  id v3 = [(PCPrinter *)self _uuid];

  if (!v3)
  {
    v4 = [(PCPrinter *)self printerInfo];

    if (v4)
    {
      id v5 = [(PCPrinter *)self deviceURI];
      v6 = (char *)[v5 rangeOfString:@"uuid="];
      if (v7)
      {
        v8 = [v5 substringFromIndex:&v6[v7]];

        if (v8)
        {
LABEL_8:
          v9 = [v8 uppercaseString];
          [(PCPrinter *)self set_uuid:v9];

          goto LABEL_9;
        }
      }
      else
      {
      }
    }
    v12.receiver = self;
    v12.super_class = (Class)PCPrinter;
    v8 = [(PCPrinter *)&v12 uuid];
    goto LABEL_8;
  }
LABEL_9:
  v10 = [(PCPrinter *)self _uuid];

  return (NSString *)v10;
}

- (NSString)displayName
{
  id v3 = [(PCPrinter *)self printerInfo];

  if (v3)
  {
    v4 = [(PCPrinter *)self printerInfo];
    id v5 = [v4 objectForKeyedSubscript:@"printer-info"];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PCPrinter;
    id v5 = [(PCPrinter *)&v7 displayName];
  }

  return (NSString *)v5;
}

- (NSString)location
{
  id v3 = [(PCPrinter *)self printerInfo];

  if (v3)
  {
    v4 = [(PCPrinter *)self printerInfo];
    id v5 = [v4 objectForKeyedSubscript:@"printer-location"];

    v6 = &stru_10001DC70;
    if (v5) {
      v6 = v5;
    }
    objc_super v7 = v6;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PCPrinter;
    objc_super v7 = [(PCPrinter *)&v9 location];
  }

  return (NSString *)v7;
}

- (NSAttributedString)displayNameWithLocation
{
  id v3 = objc_alloc((Class)NSMutableAttributedString);
  v4 = [(PCPrinter *)self displayName];
  id v5 = [v3 initWithString:v4];

  v6 = [(PCPrinter *)self location];
  if ([v6 length])
  {
    objc_super v7 = [(PCPrinter *)self displayName];
    unsigned __int8 v8 = [v7 containsString:v6];

    if ((v8 & 1) == 0)
    {
      objc_super v9 = +[NSString stringWithFormat:@" (%@)", v6];
      id v10 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v9];
      v15[0] = NSFontAttributeName;
      +[UIFont smallSystemFontSize];
      v11 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
      v16[0] = v11;
      v15[1] = NSForegroundColorAttributeName;
      objc_super v12 = +[UIColor secondaryLabelColor];
      v16[1] = v12;
      v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

      [v10 addAttributes:v13 range:0, [v10 length]];
      [v5 appendAttributedString:v10];
    }
  }

  return (NSAttributedString *)v5;
}

- (NSString)makeAndModel
{
  id v3 = [(PCPrinter *)self printerInfo];

  if (v3)
  {
    v4 = [(PCPrinter *)self printerInfo];
    id v5 = [v4 objectForKeyedSubscript:@"printer-make-and-model"];

    v6 = &stru_10001DC70;
    if (v5) {
      v6 = v5;
    }
    objc_super v7 = v6;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PCPrinter;
    objc_super v7 = [(PCPrinter *)&v9 makeAndModel];
  }

  return (NSString *)v7;
}

- (NSString)version
{
  return (NSString *)@"0.0";
}

- (BOOL)isRemote
{
  return 0;
}

- (BOOL)isAirPrint
{
  return 1;
}

- (BOOL)isNearby
{
  return 1;
}

- (BOOL)isBonjour
{
  return 0;
}

- (BOOL)isiCloudPrinter
{
  return 1;
}

- (BOOL)isFavorite
{
  return 0;
}

- (BOOL)isDirectConnect
{
  return 0;
}

- (BOOL)isOffline
{
  return 0;
}

- (int64_t)state
{
  id v3 = [(PCPrinter *)self printerInfo];

  if (!v3) {
    return 3;
  }
  v4 = [(PCPrinter *)self printerInfo];
  id v5 = [v4 objectForKeyedSubscript:@"printer-state"];
  id v6 = [v5 integerValue];

  return (int64_t)v6;
}

- (NSString)printerStateMessage
{
  objc_super v2 = [(PCPrinter *)self printerInfo];
  id v3 = [v2 objectForKeyedSubscript:@"printer-state-message"];

  return (NSString *)v3;
}

- (NSArray)printerStateReasons
{
  objc_super v2 = [(PCPrinter *)self printerInfo];
  id v3 = [v2 objectForKeyedSubscript:@"printer-state-reasons"];

  return (NSArray *)v3;
}

- (NSArray)classMembers
{
  objc_super v2 = [(PCPrinter *)self printerInfo];
  id v3 = [v2 objectForKeyedSubscript:@"member-names"];

  return (NSArray *)v3;
}

- (id)printerLocalizedStateReason:(id)a3
{
  return 0;
}

- (unint64_t)jobTypesSupported
{
  return 0;
}

- (int64_t)jobAccountIDSupport
{
  return 0;
}

- (int64_t)kind
{
  objc_super v2 = [(PCPrinter *)self deviceURI];
  if (([v2 hasPrefix:@"usb:"] & 1) != 0
    || ([v2 hasPrefix:@"ippusb:"] & 1) != 0
    || ([v2 hasPrefix:@"bluetooth:"] & 1) != 0)
  {
    int64_t v3 = 3;
  }
  else if (([v2 hasPrefix:@"mdns:"] & 1) != 0 {
         || ([v2 hasPrefix:@"dnssd:"] & 1) != 0)
  }
  {
    int64_t v3 = 4;
  }
  else if ([v2 hasPrefix:@"smb:"])
  {
    int64_t v3 = 6;
  }
  else
  {
    int64_t v3 = 5;
  }

  return v3;
}

- (int64_t)category
{
  return 1;
}

- (int64_t)displayCategory
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  if ([v5 isEqual:objc_opt_class()])
  {
    id v6 = [v4 name];
    objc_super v7 = [(PCPrinter *)self name];
    unsigned __int8 v8 = [v6 isEqualToString:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)isEqualToPCPrinter:(id)a3
{
  id v4 = a3;
  id v5 = [v4 name];
  id v6 = [(PCPrinter *)self name];
  if ([v5 isEqualToString:v6])
  {
    objc_super v7 = [v4 uuid];
    unsigned __int8 v8 = [(PCPrinter *)self uuid];
    if ([v7 isEqualToString:v8])
    {
      objc_super v9 = [v4 deviceURI];
      id v10 = [(PCPrinter *)self deviceURI];
      if ([v9 isEqualToString:v10])
      {
        id v11 = [v4 category];
        BOOL v12 = v11 == (id)[(PCPrinter *)self category];
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)isEqualToPKPrinter:(id)a3
{
  id v4 = [a3 uuid];
  id v5 = [v4 uppercaseString];
  id v6 = [(PCPrinter *)self uuid];
  unsigned __int8 v7 = [v5 isEqualToString:v6];

  return v7;
}

- (BOOL)isEqualToiCloudPrinter:(id)a3
{
  id v4 = a3;
  id v5 = [(PCPrinter *)self deviceURI];
  id v6 = [v4 printerURLs];
  unsigned __int8 v7 = [v6 firstObject];

  unsigned __int8 v8 = +[NSURL URLWithString:v7];
  objc_super v9 = [v8 scheme];
  id v10 = [v8 host];
  id v11 = [v8 path];
  BOOL v12 = +[NSString stringWithFormat:@"%@://%@%@", v9, v10, v11];

  if (([v7 isEqualToString:v5] & 1) != 0
    || [v12 isEqualToString:v5])
  {
    v13 = [v4 uuid];
    v14 = [v13 uppercaseString];
    v15 = [(PCPrinter *)self uuid];
    unsigned __int8 v16 = [v14 isEqualToString:v15];
  }
  else
  {
    unsigned __int8 v16 = 0;
  }

  return v16;
}

- (BOOL)update
{
  return 0;
}

- (int64_t)remove
{
  return 0;
}

- (int64_t)pause
{
  return 0;
}

- (int64_t)resume
{
  return 0;
}

+ (id)printers
{
  return +[NSArray array];
}

- (NSArray)supportedMimeTypes
{
  objc_super v2 = [(PCPrinter *)self printerInfo];
  int64_t v3 = [v2 objectForKeyedSubscript:@"document-format-supported"];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = +[NSArray array];
  }
  id v5 = v4;

  return (NSArray *)v5;
}

- (BOOL)supportsJobAccountID
{
  objc_super v2 = [(PCPrinter *)self printerInfo];
  int64_t v3 = [v2 objectForKeyedSubscript:@"job-account-id-supported"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)authInfoRequired
{
  objc_super v2 = [(PCPrinter *)self printerInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"auth-info-required"];

  if (v3) {
    BOOL v4 = (__CFString *)v3;
  }
  else {
    BOOL v4 = @"none";
  }

  return v4;
}

- (BOOL)requiresAuthentication
{
  objc_super v2 = [(PCPrinter *)self authInfoRequired];
  char v3 = [v2 isEqualToString:@"none"] ^ 1;

  return v3;
}

- (NSArray)ppdStateReasons
{
  return 0;
}

- (NSDictionary)printerInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPrinterInfo:(id)a3
{
}

- (NSURL)helpBookURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)adminURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)thumbnailData
{
  return self->_thumbnailData;
}

- (void)setThumbnailData:(id)a3
{
}

- (NSString)_uuid
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)set_uuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__uuid, 0);
  objc_storeStrong((id *)&self->_thumbnailData, 0);
  objc_storeStrong((id *)&self->_adminURL, 0);
  objc_storeStrong((id *)&self->_helpBookURL, 0);

  objc_storeStrong((id *)&self->_printerInfo, 0);
}

@end