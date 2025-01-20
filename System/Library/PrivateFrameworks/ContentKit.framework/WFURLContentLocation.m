@interface WFURLContentLocation
+ (BOOL)supportsSecureCoding;
+ (WFURLContentLocation)evernoteLocation;
+ (WFURLContentLocation)giphyLocation;
+ (WFURLContentLocation)imgurLocation;
+ (WFURLContentLocation)instapaperLocation;
+ (WFURLContentLocation)locationWithHostname:(id)a3;
+ (WFURLContentLocation)locationWithHostnames:(id)a3;
+ (WFURLContentLocation)locationWithURL:(id)a3 error:(id *)a4;
+ (WFURLContentLocation)locationWithURLs:(id)a3 error:(id *)a4;
+ (WFURLContentLocation)pinboardLocation;
+ (WFURLContentLocation)pocketLocation;
+ (WFURLContentLocation)todoistLocation;
+ (WFURLContentLocation)trelloLocation;
+ (WFURLContentLocation)tumblrLocation;
+ (WFURLContentLocation)wordpressLocation;
+ (id)invalidHostnameErrorForInputURL:(id)a3;
+ (id)locationMatchingAnyHostname;
+ (id)objectWithWFSerializedRepresentation:(id)a3;
- (BOOL)allowsAnyHostname;
- (BOOL)isEqual:(id)a3;
- (BOOL)matches:(id)a3;
- (NSSet)hostnames;
- (NSString)description;
- (WFURLContentLocation)initWithCoder:(id)a3;
- (WFURLContentLocation)initWithHostnames:(id)a3;
- (WFURLContentLocation)initWithHostnames:(id)a3 allowsAnyHostname:(BOOL)a4;
- (id)hostnamesSortedAlphabetically;
- (id)localizedTitle;
- (id)wfSerializedRepresentation;
- (unint64_t)hash;
- (unint64_t)managedLevel;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFURLContentLocation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostnames, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

- (BOOL)allowsAnyHostname
{
  return self->_allowsAnyHostname;
}

- (NSSet)hostnames
{
  return self->_hostnames;
}

- (BOOL)matches:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v7 = 0;
    v6 = 0;
    char v5 = 0;
LABEL_8:

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
    char v5 = 0;
    v7 = v4;
    goto LABEL_8;
  }
  if (![(WFURLContentLocation *)self allowsAnyHostname])
  {
    v7 = [(WFURLContentLocation *)self hostnames];
    v8 = [v4 hostnames];
    char v5 = [v7 isEqualToSet:v8];

    v6 = v4;
    goto LABEL_8;
  }
  char v5 = 1;
  v6 = v4;
LABEL_9:

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  v6 = (void *)MEMORY[0x263F08950];
  v7 = [(WFURLContentLocation *)self hostnamesSortedAlphabetically];
  v8 = [v6 localizedStringByJoiningStrings:v7];
  v9 = [v3 stringWithFormat:@"<%@: %p, hostnames: %@, allowsAnyHostname: %d>", v5, self, v8, -[WFURLContentLocation allowsAnyHostname](self, "allowsAnyHostname")];

  return (NSString *)v9;
}

- (id)wfSerializedRepresentation
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  v9.receiver = self;
  v9.super_class = (Class)WFURLContentLocation;
  id v4 = [(WFContentLocation *)&v9 wfSerializedRepresentation];
  char v5 = [v3 dictionaryWithDictionary:v4];

  v6 = [(WFURLContentLocation *)self hostnamesSortedAlphabetically];
  [v5 setValue:v6 forKey:@"hostnames"];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[WFURLContentLocation allowsAnyHostname](self, "allowsAnyHostname"));
  [v5 setValue:v7 forKey:@"allowsAnyHostname"];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFURLContentLocation;
  id v4 = a3;
  [(WFContentLocation *)&v6 encodeWithCoder:v4];
  char v5 = [(WFURLContentLocation *)self hostnames];
  [v4 encodeObject:v5 forKey:@"hostnames"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFURLContentLocation allowsAnyHostname](self, "allowsAnyHostname"), @"allowsAnyHostname");
}

- (WFURLContentLocation)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_super v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  v7 = [v4 setWithArray:v6];
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"hostnames"];

  uint64_t v9 = [v5 decodeBoolForKey:@"allowsAnyHostname"];
  v10 = [(WFURLContentLocation *)self initWithHostnames:v8 allowsAnyHostname:v9];

  return v10;
}

- (unint64_t)hash
{
  v3 = [(WFURLContentLocation *)self hostnames];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(WFURLContentLocation *)self allowsAnyHostname];
  uint64_t v6 = 3133065982;
  if (v5) {
    uint64_t v6 = 3405691582;
  }
  unint64_t v7 = v6 ^ v4;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v5 = [(WFURLContentLocation *)self hostnames];
    uint64_t v6 = [v4 hostnames];
    if ([v5 isEqualToSet:v6])
    {
      BOOL v7 = [(WFURLContentLocation *)self allowsAnyHostname];
      int v8 = v7 ^ [v4 allowsAnyHostname] ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (unint64_t)managedLevel
{
  if (self->_allowsAnyHostname) {
    return 0;
  }
  id v4 = +[WFManagedConfigurationProfile defaultProfile];
  BOOL v5 = [(WFURLContentLocation *)self hostnames];
  uint64_t v6 = objc_msgSend(v5, "if_compactMap:", &__block_literal_global_181);
  BOOL v7 = [v6 allObjects];
  unint64_t v8 = [v4 managedLevelForContentOfURLs:v7];

  return v8;
}

id __36__WFURLContentLocation_managedLevel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_opt_new();
  [v3 setScheme:@"https"];
  [v3 setHost:v2];

  id v4 = [v3 URL];

  return v4;
}

- (id)localizedTitle
{
  localizedTitle = self->_localizedTitle;
  if (localizedTitle) {
    goto LABEL_2;
  }
  if (!self->_allowsAnyHostname)
  {
    uint64_t v6 = [(WFURLContentLocation *)self hostnamesSortedAlphabetically];
    BOOL v7 = objc_msgSend(v6, "if_map:", &__block_literal_global);

    unint64_t v8 = [MEMORY[0x263F08950] localizedStringByJoiningStrings:v7];
    uint64_t v9 = self->_localizedTitle;
    self->_localizedTitle = v8;

    localizedTitle = self->_localizedTitle;
LABEL_2:
    v3 = localizedTitle;
    goto LABEL_5;
  }
  WFLocalizedString(@"Any URL");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_5:
  return v3;
}

id __38__WFURLContentLocation_localizedTitle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[WFContentLocationLocalizations localizedTitleForContentLocationWithHostname:v2];
  id v4 = v3;
  if (!v3) {
    v3 = v2;
  }
  id v5 = v3;

  return v5;
}

- (id)hostnamesSortedAlphabetically
{
  id v2 = [(WFURLContentLocation *)self hostnames];
  v3 = [v2 allObjects];
  id v4 = [v3 sortedArrayUsingSelector:sel_localizedStandardCompare_];

  return v4;
}

- (WFURLContentLocation)initWithHostnames:(id)a3
{
  return [(WFURLContentLocation *)self initWithHostnames:a3 allowsAnyHostname:0];
}

- (WFURLContentLocation)initWithHostnames:(id)a3 allowsAnyHostname:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFURLContentLocation;
  unint64_t v8 = [(WFContentLocation *)&v16 initWithIdentifier:@"com.apple.shortcuts.urldestination" promptingBehaviour:1];
  if (v8)
  {
    uint64_t v9 = [v7 count];
    if (v4)
    {
      if (!v9)
      {
        [v7 count];
        goto LABEL_12;
      }
      v10 = getWFSecurityLogObject();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 136315138;
      v18 = "-[WFURLContentLocation initWithHostnames:allowsAnyHostname:]";
      v11 = "%s Creating a WFURLContentLocation with 1 or more hostname(s), but allowsAnyHostname was also set to YES.";
      v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_FAULT;
    }
    else
    {
      if (v9)
      {
LABEL_12:
        objc_storeStrong((id *)&v8->_hostnames, a3);
        v8->_allowsAnyHostname = v4;
        v14 = v8;
        goto LABEL_13;
      }
      v10 = getWFSecurityLogObject();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_10:

        goto LABEL_12;
      }
      *(_DWORD *)buf = 136315138;
      v18 = "-[WFURLContentLocation initWithHostnames:allowsAnyHostname:]";
      v11 = "%s Creating a WFURLContentLocation with no hostname(s)";
      v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_216505000, v12, v13, v11, buf, 0xCu);
    goto LABEL_10;
  }
LABEL_13:

  return v8;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 wfObjectOfClass:objc_opt_class() forKeyPath:@"hostnames"];
  if (v5)
  {
    uint64_t v6 = [v4 wfObjectOfClass:objc_opt_class() forKeyPath:@"allowsAnyHostname"];
    uint64_t v7 = [v6 BOOLValue];

    id v8 = objc_alloc((Class)a1);
    uint64_t v9 = [MEMORY[0x263EFFA08] setWithArray:v5];
    v10 = (void *)[v8 initWithHostnames:v9 allowsAnyHostname:v7];
  }
  else
  {
    v11 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      v14 = "+[WFURLContentLocation objectWithWFSerializedRepresentation:]";
      _os_log_impl(&dword_216505000, v11, OS_LOG_TYPE_ERROR, "%s Failed to decode hostnames from WFURLContentLocation", (uint8_t *)&v13, 0xCu);
    }

    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)invalidHostnameErrorForInputURL:(id)a3
{
  v20[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = WFLocalizedString(@"Invalid URL");
  id v5 = [v3 absoluteString];

  if (v5 && (unint64_t)[v5 length] >= 0x1A)
  {
    uint64_t v6 = NSString;
    uint64_t v7 = [v5 substringToIndex:25];
    uint64_t v8 = [v6 stringWithFormat:@"%@…", v7];

    id v5 = (void *)v8;
  }
  uint64_t v9 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"\"““"];
  v10 = [v5 stringByTrimmingCharactersInSet:v9];

  v11 = NSString;
  v12 = WFLocalizedString(@"The URL “%@” is missing a hostname.");
  int v13 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);

  v14 = (void *)MEMORY[0x263F087E8];
  uint64_t v15 = *MEMORY[0x263F08320];
  v19[0] = *MEMORY[0x263F08338];
  v19[1] = v15;
  v20[0] = v4;
  v20[1] = v13;
  objc_super v16 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  v17 = [v14 errorWithDomain:@"WFURLContentLocationErrorDomain" code:0 userInfo:v16];

  return v17;
}

+ (id)locationMatchingAnyHostname
{
  id v2 = objc_alloc((Class)a1);
  id v3 = [MEMORY[0x263EFFA08] set];
  id v4 = (void *)[v2 initWithHostnames:v3 allowsAnyHostname:1];

  return v4;
}

+ (WFURLContentLocation)locationWithURLs:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v21 = [MEMORY[0x263EFF9C0] set];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v20 = 0;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v12 = [v11 scheme];
        int v13 = [v12 lowercaseString];
        char v14 = [v13 isEqualToString:@"data"];

        if ((v14 & 1) == 0)
        {
          uint64_t v15 = [v11 host];

          if (v15)
          {
            objc_super v16 = [v11 host];
            [v21 addObject:v16];
          }
          else
          {
            if (a4)
            {
              *a4 = [a1 invalidHostnameErrorForInputURL:v11];
            }
            char v20 = 1;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }
  else
  {
    char v20 = 0;
  }

  v17 = 0;
  if ([v21 count] && (v20 & 1) == 0) {
    v17 = (void *)[objc_alloc((Class)a1) initWithHostnames:v21];
  }

  return (WFURLContentLocation *)v17;
}

+ (WFURLContentLocation)locationWithURL:(id)a3 error:(id *)a4
{
  id v6 = [MEMORY[0x263EFFA08] setWithObject:a3];
  uint64_t v7 = [a1 locationWithURLs:v6 error:a4];

  return (WFURLContentLocation *)v7;
}

+ (WFURLContentLocation)locationWithHostnames:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithHostnames:v4];

  return (WFURLContentLocation *)v5;
}

+ (WFURLContentLocation)locationWithHostname:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [MEMORY[0x263EFFA08] setWithObject:v4];

  uint64_t v7 = (void *)[v5 initWithHostnames:v6];
  return (WFURLContentLocation *)v7;
}

+ (WFURLContentLocation)wordpressLocation
{
  return +[WFURLContentLocation locationWithHostname:@"wordpress.com"];
}

+ (WFURLContentLocation)tumblrLocation
{
  return +[WFURLContentLocation locationWithHostname:@"tumblr.com"];
}

+ (WFURLContentLocation)trelloLocation
{
  return +[WFURLContentLocation locationWithHostname:@"api.trello.com"];
}

+ (WFURLContentLocation)todoistLocation
{
  return +[WFURLContentLocation locationWithHostname:@"todoist.com"];
}

+ (WFURLContentLocation)pocketLocation
{
  return +[WFURLContentLocation locationWithHostname:@"getpocket.com"];
}

+ (WFURLContentLocation)pinboardLocation
{
  return +[WFURLContentLocation locationWithHostname:@"api.pinboard.in"];
}

+ (WFURLContentLocation)instapaperLocation
{
  return +[WFURLContentLocation locationWithHostname:@"instapaper.com"];
}

+ (WFURLContentLocation)imgurLocation
{
  return +[WFURLContentLocation locationWithHostname:@"api.imgur.com"];
}

+ (WFURLContentLocation)giphyLocation
{
  return +[WFURLContentLocation locationWithHostname:@"api.giphy.com"];
}

+ (WFURLContentLocation)evernoteLocation
{
  return +[WFURLContentLocation locationWithHostname:@"evernote.com"];
}

@end