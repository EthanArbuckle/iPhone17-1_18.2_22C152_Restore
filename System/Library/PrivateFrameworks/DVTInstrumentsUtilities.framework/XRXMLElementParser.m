@interface XRXMLElementParser
+ (id)_elementNameToClassMap;
+ (id)_elementNameToKVCMap;
- (NSDictionary)elementAttributes;
- (NSString)elementName;
- (XRXMLElementParser)initWithElementName:(id)a3 context:(id)a4;
- (id)endElementAtLine:(int64_t)a3 col:(int64_t)a4;
- (id)lineAndColumnForElementEnd;
- (id)lineAndColumnForElementStart;
- (id)startElementWithName:(id)a3 attributes:(id)a4 line:(int64_t)a5 col:(int64_t)a6;
- (id)valueForElementName:(id)a3;
- (void)processCharacters:(id)a3;
- (void)setValue:(id)a3 forElementName:(id)a4;
- (void)simulateEmptyElement:(id)a3;
@end

@implementation XRXMLElementParser

+ (id)_elementNameToClassMap
{
  return 0;
}

+ (id)_elementNameToKVCMap
{
  if (qword_2687AA178 != -1) {
    dispatch_once(&qword_2687AA178, &unk_26E752550);
  }
  v2 = (void *)qword_2687AA170;

  return v2;
}

- (XRXMLElementParser)initWithElementName:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)XRXMLElementParser;
  v8 = [(XRXMLElementParser *)&v30 init];
  if (v8)
  {
    v9 = objc_opt_class();
    uint64_t v14 = [v9 _elementNameToClassMap:v10 withOptions:v11 withError:v12 withContext:v13];
    elementToClass = v8->_elementToClass;
    v8->_elementToClass = (NSDictionary *)v14;

    v16 = objc_opt_class();
    uint64_t v21 = [v16 elementNameToKVCMap:v17, v18, v19, v20];
    elementToKVC = v8->_elementToKVC;
    v8->_elementToKVC = (NSDictionary *)v21;

    uint64_t v27 = [v6 copyWithZone:v23 usingConcreteClass:v24 forClass:v25 withSelector:v26];
    elementName = v8->_elementName;
    v8->_elementName = (NSString *)v27;

    objc_storeStrong(&v8->context, a4);
  }

  return v8;
}

- (id)startElementWithName:(id)a3 attributes:(id)a4 line:(int64_t)a5 col:(int64_t)a6
{
  id v10 = a4;
  elementToClass = self->_elementToClass;
  id v12 = a3;
  v16 = (objc_class *)[elementToClass objectForKeyedSubscript:v13 atIndex:v12 withType:v14 withClass:v15];
  if (!v16)
  {
    uint64_t v26 = [XRXMLIgnoreElementParser alloc];
    uint64_t v20 = [v26 initWithElementName:v27 context:(uint64_t)v12 context:(uint64_t)self->context];
    goto LABEL_6;
  }
  id v17 = [v16 alloc];
  uint64_t v20 = [v17 initWithElementName:v18 context:self->context];

  if (v10 && [v10 v21:v22 v23:v24])
  {
    id v25 = v10;
    id v12 = *(id *)(v20 + 80);
    *(void *)(v20 + 80) = v25;
LABEL_6:
  }
  objc_storeStrong((id *)(v20 + 16), self);
  *(void *)(v20 + 24) = a5;
  *(void *)(v20 + 32) = a6;
  [v20 _handleStart:v29, v30, v31, v32];

  return (id)v20;
}

- (id)lineAndColumnForElementStart
{
  return [NSString stringWithFormat:@"%lld:%lld", v2, v3, self->_lineOfStart, self->_colOfStart];
}

- (id)lineAndColumnForElementEnd
{
  return [NSString stringWithFormat:@"%lld:%lld", v2, v3, self->_lineOfEnd, self->_colOfEnd];
}

- (id)endElementAtLine:(int64_t)a3 col:(int64_t)a4
{
  self->_lineOfEnd = a3;
  self->_colOfEnd = a4;
  [self _handleCompletion:a2 withTransitionContext:a3 completion:a4];
  id v6 = self->parent;
  parent = self->parent;
  self->parent = 0;

  return v6;
}

- (void)processCharacters:(id)a3
{
}

- (void)setValue:(id)a3 forElementName:(id)a4
{
  id v14 = a4;
  elementToKVC = self->_elementToKVC;
  id v7 = a3;
  uint64_t v13 = [elementToKVC objectForKeyedSubscript:v8 withKey:v14 withKey:v9 withKey:v10];
  if (v13) {
    [self setValue:v11 forKey:(uint64_t)v7];
  }
  else {
    [self setValue:v11 forKey:(uint64_t)v7];
  }
}

- (id)valueForElementName:(id)a3
{
  id v4 = a3;
  uint64_t v11 = [self->_elementToKVC objectForKeyedSubscript:v5 atIndex:v4 inRange:v6 withOptions:v7];
  if (v11) {
    [self valueForKey:v8 withObject:v9 withObject:v10];
  }
  else {
  uint64_t v12 = [self valueForKey:v8 withValue:v4 withValue:v9 withValue:v10];
  }

  return v12;
}

- (void)simulateEmptyElement:(id)a3
{
  [self startElementWithName:a2 attributes:a3 line:self->_lineOfStart col:self->_colOfStart];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v7 endElementAtLine:self->_lineOfStart col:self->_colOfStart withName:v5];
}

- (NSString)elementName
{
  return self->_elementName;
}

- (NSDictionary)elementAttributes
{
  return self->_elementAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementAttributes, 0);
  objc_storeStrong((id *)&self->_elementName, 0);
  objc_storeStrong((id *)&self->_elementToKVC, 0);
  objc_storeStrong((id *)&self->_elementToClass, 0);
  objc_storeStrong((id *)&self->parent, 0);

  objc_storeStrong(&self->context, 0);
}

@end