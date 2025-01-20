@interface WPXMLRPCDecoderDelegate
- (BOOL)isDictionaryElementType:(int)a3;
- (WPXMLRPCDecoderDelegate)initWithParent:(id)a3;
- (id)elementKey;
- (id)elementValue;
- (id)parent;
- (id)parseBoolean:(id)a3;
- (id)parseData:(id)a3;
- (id)parseDate:(id)a3;
- (id)parseDateString:(id)a3 withFormat:(id)a4;
- (id)parseDouble:(id)a3;
- (id)parseInteger:(id)a3;
- (id)parseString:(id)a3;
- (int)elementType;
- (void)addElementValueToParent;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
- (void)setElementKey:(id)a3;
- (void)setElementType:(int)a3;
- (void)setElementValue:(id)a3;
- (void)setParent:(id)a3;
@end

@implementation WPXMLRPCDecoderDelegate

- (void).cxx_destruct
{
  objc_storeStrong(&self->myElementValue, 0);
  objc_storeStrong((id *)&self->myElementKey, 0);
  objc_storeStrong((id *)&self->myChildren, 0);
  objc_destroyWeak((id *)&self->myParent);
}

- (id)elementValue
{
  return self->myElementValue;
}

- (void)setElementValue:(id)a3
{
}

- (id)elementKey
{
  return self->myElementKey;
}

- (void)setElementKey:(id)a3
{
}

- (int)elementType
{
  return self->myElementType;
}

- (void)setElementType:(int)a3
{
  self->myElementType = a3;
}

- (id)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->myParent);
  return WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (WPXMLRPCDecoderDelegate)initWithParent:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WPXMLRPCDecoderDelegate;
  v5 = [(WPXMLRPCDecoderDelegate *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->myParent, v4);
    uint64_t v7 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
    myChildren = v6->myChildren;
    v6->myChildren = (NSMutableArray *)v7;

    v6->myElementType = 7;
    myElementKey = v6->myElementKey;
    v6->myElementKey = 0;

    id v10 = objc_alloc_init(MEMORY[0x263F089D8]);
    id myElementValue = v6->myElementValue;
    v6->id myElementValue = v10;
  }
  return v6;
}

- (id)parseData:(id)a3
{
  return +[WPBase64Utils decodeString:a3];
}

- (id)parseDate:(id)a3
{
  id v4 = a3;
  v5 = [(WPXMLRPCDecoderDelegate *)self parseDateString:v4 withFormat:@"yyyyMMdd'T'HH:mm:ss"];
  if (!v5)
  {
    v5 = [(WPXMLRPCDecoderDelegate *)self parseDateString:v4 withFormat:@"yyyy'-'MM'-'dd'T'HH:mm:ss"];
    if (!v5)
    {
      v5 = [MEMORY[0x263EFF9D0] null];
    }
  }

  return v5;
}

- (id)parseString:(id)a3
{
  v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  v5 = [v3 whitespaceAndNewlineCharacterSet];
  v6 = [v4 stringByTrimmingCharactersInSet:v5];

  return v6;
}

- (id)parseBoolean:(id)a3
{
  uint64_t v3 = [a3 isEqualToString:@"1"];
  id v4 = [NSNumber numberWithBool:v3];
  return v4;
}

- (id)parseDouble:(id)a3
{
  uint64_t v3 = NSNumber;
  [a3 doubleValue];
  return (id)objc_msgSend(v3, "numberWithDouble:");
}

- (id)parseInteger:(id)a3
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = [a3 integerValue];
  return (id)[v3 numberWithInteger:v4];
}

- (id)parseDateString:(id)a3 withFormat:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263EFF960];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
  id v9 = objc_alloc_init(MEMORY[0x263F08790]);
  [v9 setLocale:v8];
  id v10 = [MEMORY[0x263EFFA18] timeZoneWithName:@"GMT"];
  [v9 setTimeZone:v10];

  [v9 setDateFormat:v6];
  v11 = [v9 dateFromString:v7];

  return v11;
}

- (void)addElementValueToParent
{
  p_myParent = &self->myParent;
  id WeakRetained = objc_loadWeakRetained((id *)&self->myParent);
  id v14 = [WeakRetained elementValue];

  id v5 = objc_loadWeakRetained((id *)p_myParent);
  int v6 = [v5 elementType];

  if (v6 == 2)
  {
    int myElementType = self->myElementType;
    id v11 = objc_loadWeakRetained((id *)p_myParent);
    v12 = v11;
    id myElementValue = self->myElementValue;
    if (myElementType == 3) {
      [v11 setElementKey:myElementValue];
    }
    else {
      [v11 setElementValue:myElementValue];
    }
  }
  else if (v6 == 1)
  {
    id v8 = self->myElementValue;
    id v9 = [MEMORY[0x263EFF9D0] null];
    LODWORD(v8) = [v8 isEqual:v9];

    if (v8) {
      [v14 removeObjectForKey:self->myElementKey];
    }
    else {
      [v14 setObject:self->myElementValue forKey:self->myElementKey];
    }
  }
  else
  {
    id v7 = v14;
    if (v6) {
      goto LABEL_13;
    }
    [v14 addObject:self->myElementValue];
  }
  id v7 = v14;
LABEL_13:
}

- (BOOL)isDictionaryElementType:(int)a3
{
  return (self->myElementType - 1) < 2;
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (self->myElementType && !-[WPXMLRPCDecoderDelegate isDictionaryElementType:](self, "isDictionaryElementType:"))
  {
    id myElementValue = self->myElementValue;
    if (myElementValue)
    {
      [myElementValue appendString:v6];
    }
    else
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:v6];
      id v9 = self->myElementValue;
      self->id myElementValue = v8;
    }
  }
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v16 = a3;
  id v8 = a4;
  if (([v8 isEqualToString:@"value"] & 1) != 0
    || ([v8 isEqualToString:@"member"] & 1) != 0
    || [v8 isEqualToString:@"name"])
  {
    if (self->myElementType)
    {
      if (-[WPXMLRPCDecoderDelegate isDictionaryElementType:](self, "isDictionaryElementType:"))
      {
        id v9 = 0;
      }
      else
      {
        id v9 = [(WPXMLRPCDecoderDelegate *)self parseString:self->myElementValue];
        id myElementValue = self->myElementValue;
        self->id myElementValue = 0;
      }
      switch(self->myElementType)
      {
        case 3:
        case 7:
          id v11 = v9;
          goto LABEL_16;
        case 4:
          id v11 = [(WPXMLRPCDecoderDelegate *)self parseInteger:v9];
          goto LABEL_16;
        case 5:
          id v11 = [(WPXMLRPCDecoderDelegate *)self parseDouble:v9];
          goto LABEL_16;
        case 6:
          id v11 = [(WPXMLRPCDecoderDelegate *)self parseBoolean:v9];
          goto LABEL_16;
        case 8:
          id v11 = [(WPXMLRPCDecoderDelegate *)self parseDate:v9];
          goto LABEL_16;
        case 9:
          id v11 = [(WPXMLRPCDecoderDelegate *)self parseData:v9];
LABEL_16:
          id v12 = self->myElementValue;
          self->id myElementValue = v11;

          break;
        default:
          break;
      }
    }
    else
    {
      id v9 = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->myParent);
    if (WeakRetained)
    {
      id v14 = self->myElementValue;

      if (v14) {
        [(WPXMLRPCDecoderDelegate *)self addElementValueToParent];
      }
    }
    id v15 = objc_loadWeakRetained((id *)&self->myParent);
    [v16 setDelegate:v15];
  }
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v16 = a3;
  id v9 = a4;
  if (([v9 isEqualToString:@"value"] & 1) != 0
    || ([v9 isEqualToString:@"member"] & 1) != 0
    || [v9 isEqualToString:@"name"])
  {
    id v10 = [[WPXMLRPCDecoderDelegate alloc] initWithParent:self];
    if ([v9 isEqualToString:@"member"])
    {
      uint64_t v11 = 2;
    }
    else
    {
      if (![v9 isEqualToString:@"name"])
      {
LABEL_9:
        [(NSMutableArray *)self->myChildren addObject:v10];
        [v16 setDelegate:v10];
LABEL_10:

        goto LABEL_11;
      }
      uint64_t v11 = 3;
    }
    [(WPXMLRPCDecoderDelegate *)v10 setElementType:v11];
    goto LABEL_9;
  }
  if (([v9 isEqualToString:@"array"] & 1) != 0
    || [v9 isEqualToString:@"params"])
  {
    id v10 = (WPXMLRPCDecoderDelegate *)objc_alloc_init(MEMORY[0x263EFF980]);
    [(WPXMLRPCDecoderDelegate *)self setElementValue:v10];
    id v12 = self;
    uint64_t v13 = 0;
LABEL_17:
    [(WPXMLRPCDecoderDelegate *)v12 setElementType:v13];
    goto LABEL_10;
  }
  if ([v9 isEqualToString:@"struct"])
  {
    id v10 = (WPXMLRPCDecoderDelegate *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(WPXMLRPCDecoderDelegate *)self setElementValue:v10];
    id v12 = self;
    uint64_t v13 = 1;
    goto LABEL_17;
  }
  if (([v9 isEqualToString:@"int"] & 1) != 0
    || [v9 isEqualToString:@"i4"])
  {
    id v14 = self;
    uint64_t v15 = 4;
LABEL_23:
    [(WPXMLRPCDecoderDelegate *)v14 setElementType:v15];
    goto LABEL_11;
  }
  if ([v9 isEqualToString:@"double"])
  {
    id v14 = self;
    uint64_t v15 = 5;
    goto LABEL_23;
  }
  if ([v9 isEqualToString:@"BOOLean"])
  {
    id v14 = self;
    uint64_t v15 = 6;
    goto LABEL_23;
  }
  if ([v9 isEqualToString:@"string"])
  {
    id v14 = self;
    uint64_t v15 = 7;
    goto LABEL_23;
  }
  if ([v9 isEqualToString:@"dateTime.iso8601"])
  {
    id v14 = self;
    uint64_t v15 = 8;
    goto LABEL_23;
  }
  if ([v9 isEqualToString:@"base64"])
  {
    id v14 = self;
    uint64_t v15 = 9;
    goto LABEL_23;
  }
LABEL_11:
}

@end