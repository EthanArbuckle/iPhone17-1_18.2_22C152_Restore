@interface AXUIMockElement
+ (id)uiElementAtCoordinate:(CGPoint)a3;
- (AXUIMockElement)init;
- (BOOL)BOOLWithAXAttribute:(int64_t)a3;
- (BOOL)canPerformAXAction:(int)a3;
- (BOOL)canSetAXAttribute:(int64_t)a3;
- (BOOL)isApplication;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMockElement;
- (BOOL)isValid;
- (BOOL)isValidForApplication:(id)a3;
- (BOOL)performAXAction:(int)a3;
- (BOOL)performAXAction:(int)a3 withValue:(id)a4;
- (BOOL)performAXAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5;
- (BOOL)usesCarriageReturnAsLinesSeparator;
- (CGPath)pathWithAXAttribute:(int64_t)a3;
- (CGPoint)pointForLineNumber:(unint64_t)a3;
- (CGPoint)pointWithAXAttribute:(int64_t)a3;
- (CGRect)rectWithAXAttribute:(int64_t)a3;
- (CGSize)sizeWithAXAttribute:(int64_t)a3;
- (NSMutableDictionary)attributes;
- (_NSRange)rangeWithAXAttribute:(int64_t)a3;
- (__AXUIElement)axElement;
- (float)floatWithAXAttribute:(int64_t)a3;
- (id)_valueForAttribute:(int64_t)a3;
- (id)cacheUpdatedCallback;
- (id)cachedAttributes;
- (id)copyCachedAttributes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)endLoggingActions;
- (id)handleActionBlock;
- (id)nextElementsWithCount:(unint64_t)a3;
- (id)nextElementsWithParameters:(id)a3;
- (id)numberWithAXAttribute:(int64_t)a3;
- (id)objectWithAXAttribute:(int64_t)a3 parameter:(void *)a4;
- (id)performBlockWhileLoggingPerformedActions:(id)a3;
- (id)previousElementsWithCount:(unint64_t)a3;
- (id)previousElementsWithParameters:(id)a3;
- (id)stringWithAXAttribute:(int64_t)a3;
- (id)uiElementWithAXAttribute:(int64_t)a3;
- (id)visibleElements;
- (int)pid;
- (int64_t)longWithAXAttribute:(int64_t)a3;
- (unint64_t)_lineNumberForPoint:(CGPoint)a3;
- (unint64_t)arrayCountWithAXAttribute:(int64_t)a3;
- (unint64_t)hash;
- (void)setAXAttribute:(int64_t)a3 withArray:(id)a4;
- (void)setAXAttribute:(int64_t)a3 withBOOL:(BOOL)a4;
- (void)setAXAttribute:(int64_t)a3 withFloat:(float)a4;
- (void)setAXAttribute:(int64_t)a3 withLong:(int64_t)a4;
- (void)setAXAttribute:(int64_t)a3 withNumber:(id)a4;
- (void)setAXAttribute:(int64_t)a3 withObject:(id)a4;
- (void)setAXAttribute:(int64_t)a3 withObject:(id)a4 synchronous:(BOOL)a5;
- (void)setAXAttribute:(int64_t)a3 withPoint:(CGPoint)a4;
- (void)setAXAttribute:(int64_t)a3 withRange:(_NSRange)a4;
- (void)setAXAttribute:(int64_t)a3 withSize:(CGSize)a4;
- (void)setAXAttribute:(int64_t)a3 withString:(id)a4;
- (void)setAXAttribute:(int64_t)a3 withUIElement:(id)a4;
- (void)setAXAttribute:(int64_t)a3 withUIElementArray:(id)a4;
- (void)setAttributes:(id)a3;
- (void)setCacheUpdatedCallback:(id)a3;
- (void)setHandleActionBlock:(id)a3;
- (void)setIsApplication:(BOOL)a3;
- (void)setUsesCarriageReturnAsLinesSeparator:(BOOL)a3;
- (void)setValue:(id)a3 forAXAttribute:(int64_t)a4;
- (void)setValue:(id)a3 forAXParameterizedAttribute:(int64_t)a4;
- (void)setWritable:(BOOL)a3 forAXAttribute:(int64_t)a4;
- (void)startLoggingActions;
- (void)updateCache:(int64_t)a3;
@end

@implementation AXUIMockElement

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(AXUIMockElement);
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableDictionary *)v5->_attributes mutableCopy];
  attributes = v4->_attributes;
  v4->_attributes = (NSMutableDictionary *)v6;

  uint64_t v8 = [(NSMutableDictionary *)v5->_writableAttributes mutableCopy];
  writableAttributes = v4->_writableAttributes;
  v4->_writableAttributes = (NSMutableDictionary *)v8;

  uint64_t v10 = [(NSMutableDictionary *)v5->_performActionLog mutableCopy];
  performActionLog = v4->_performActionLog;
  v4->_performActionLog = (NSMutableDictionary *)v10;

  uint64_t v12 = _Block_copy(v5->_handleActionBlock);
  id handleActionBlock = v4->_handleActionBlock;
  v4->_id handleActionBlock = (id)v12;

  objc_sync_exit(v5);
  return v4;
}

+ (id)uiElementAtCoordinate:(CGPoint)a3
{
  v3 = (void *)[a1 init];
  return v3;
}

- (AXUIMockElement)init
{
  v8.receiver = self;
  v8.super_class = (Class)AXUIMockElement;
  v2 = [(AXUIMockElement *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_allocWithZone(MEMORY[0x1E4F1CA60]) init];
    attributes = v2->_attributes;
    v2->_attributes = (NSMutableDictionary *)v3;

    uint64_t v5 = [objc_allocWithZone(MEMORY[0x1E4F1CA60]) init];
    writableAttributes = v2->_writableAttributes;
    v2->_writableAttributes = (NSMutableDictionary *)v5;

    [(AXUIMockElement *)v2 setValue:MEMORY[0x1E4F1CC38] forAXAttribute:2016];
  }
  return v2;
}

- (BOOL)isMockElement
{
  return 1;
}

- (__AXUIElement)axElement
{
  return 0;
}

- (id)visibleElements
{
  return 0;
}

- (void)startLoggingActions
{
  __assert_rtn("-[AXUIMockElement startLoggingActions]", "AXUIMockElement.m", 73, "_performActionLog == nil");
}

- (id)endLoggingActions
{
  uint64_t v3 = self->_performActionLog;
  performActionLog = self->_performActionLog;
  self->_performActionLog = 0;

  return v3;
}

- (id)performBlockWhileLoggingPerformedActions:(id)a3
{
  v4 = (void (**)(void))a3;
  [(AXUIMockElement *)self startLoggingActions];
  v4[2](v4);

  return [(AXUIMockElement *)self endLoggingActions];
}

- (id)description
{
  uint64_t v3 = [(AXUIMockElement *)self stringWithAXAttribute:2001];
  v4 = [(AXUIMockElement *)self stringWithAXAttribute:2006];
  [(AXUIMockElement *)self rectWithAXAttribute:2003];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  v13 = [(AXUIMockElement *)self numberWithAXAttribute:2004];
  [v13 unsignedLongLongValue];
  v14 = (void *)_AXTraitsAsString();

  [(AXUIMockElement *)self pointWithAXAttribute:2007];
  v17 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<AXUIMockElement %p>{Text: %@, Value: %@, Frame: {%.0f,%.0f,%.0f,%.0f} CP: %.0f %.0f} : Traits: %@", self, v3, v4, v6, v8, v10, v12, v15, v16, v14];

  return v17;
}

- (id)_valueForAttribute:(int64_t)a3
{
  v4 = self;
  objc_sync_enter(v4);
  attributes = v4->_attributes;
  uint64_t v6 = [NSNumber numberWithLong:a3];
  uint64_t v7 = [(NSMutableDictionary *)attributes objectForKey:v6];

  objc_sync_exit(v4);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()
    || (uint64_t v6 = objc_opt_class(), ([v6 isSubclassOfClass:objc_opt_class()] & 1) != 0)
    || (uint64_t v7 = objc_opt_class(), [v7 isSubclassOfClass:objc_opt_class()]))
  {
    unint64_t v8 = [(AXUIMockElement *)self hash];
    BOOL v9 = v8 == [v4 hash];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)setWritable:(BOOL)a3 forAXAttribute:(int64_t)a4
{
  BOOL v5 = a3;
  obj = self;
  objc_sync_enter(obj);
  writableAttributes = obj->_writableAttributes;
  uint64_t v7 = [NSNumber numberWithLong:a4];
  if (v5) {
    uint64_t v8 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v8 = MEMORY[0x1E4F1CC28];
  }
  [(NSMutableDictionary *)writableAttributes setObject:v8 forKey:v7];

  objc_sync_exit(obj);
}

- (BOOL)canSetAXAttribute:(int64_t)a3
{
  return 1;
}

- (id)uiElementWithAXAttribute:(int64_t)a3
{
  uint64_t v3 = [(AXUIMockElement *)self _valueForAttribute:a3];
  NSClassFromString((NSString *)@"AXUIElement");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)canPerformAXAction:(int)a3
{
  return 1;
}

- (void)setValue:(id)a3 forAXAttribute:(int64_t)a4
{
  id v9 = a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  attributes = v6->_attributes;
  uint64_t v8 = [NSNumber numberWithLong:a4];
  if (v9) {
    [(NSMutableDictionary *)attributes setObject:v9 forKey:v8];
  }
  else {
    [(NSMutableDictionary *)attributes removeObjectForKey:v8];
  }

  objc_sync_exit(v6);
}

- (void)setValue:(id)a3 forAXParameterizedAttribute:(int64_t)a4
{
  id v9 = a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  attributes = v6->_attributes;
  uint64_t v8 = [NSNumber numberWithLong:a4];
  if (v9) {
    [(NSMutableDictionary *)attributes setObject:v9 forKey:v8];
  }
  else {
    [(NSMutableDictionary *)attributes removeObjectForKey:v8];
  }

  objc_sync_exit(v6);
}

- (id)stringWithAXAttribute:(int64_t)a3
{
  id v4 = [(AXUIMockElement *)self _valueForAttribute:a3];
  if ([(AXUIMockElement *)self usesCarriageReturnAsLinesSeparator])
  {
    uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"\r" withString:&stru_1F141B5A8];

    id v4 = (void *)v5;
  }
  return v4;
}

- (BOOL)BOOLWithAXAttribute:(int64_t)a3
{
  uint64_t v3 = [(AXUIMockElement *)self _valueForAttribute:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (float)floatWithAXAttribute:(int64_t)a3
{
  uint64_t v3 = [(AXUIMockElement *)self _valueForAttribute:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (int64_t)longWithAXAttribute:(int64_t)a3
{
  uint64_t v3 = [(AXUIMockElement *)self _valueForAttribute:a3];
  int64_t v4 = [v3 longValue];

  return v4;
}

- (id)numberWithAXAttribute:(int64_t)a3
{
  if ((unint64_t)(a3 - 4001) > 1)
  {
    uint64_t v7 = [(AXUIMockElement *)self _valueForAttribute:a3];
  }
  else
  {
    uint64_t v5 = [(AXUIMockElement *)self rangeWithAXAttribute:2005];
    long long v9 = xmmword_1BA6A62B0;
    AXValueGetValue((AXValueRef)-[AXUIMockElement objectWithAXAttribute:parameter:](self, "objectWithAXAttribute:parameter:", 94009, [NSNumber numberWithUnsignedInteger:v5]), kAXValueTypeCFRange, &v9);
    uint64_t v6 = *((void *)&v9 + 1);
    if (a3 == 4001) {
      uint64_t v6 = 0;
    }
    uint64_t v7 = [NSNumber numberWithInteger:(void)v9 + v6];
  }
  return v7;
}

- (CGPoint)pointWithAXAttribute:(int64_t)a3
{
  uint64_t v3 = [(AXUIMockElement *)self _valueForAttribute:a3];
  [v3 pointValue];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGSize)sizeWithAXAttribute:(int64_t)a3
{
  uint64_t v3 = [(AXUIMockElement *)self _valueForAttribute:a3];
  [v3 sizeValue];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_NSRange)rangeWithAXAttribute:(int64_t)a3
{
  double v4 = -[AXUIMockElement _valueForAttribute:](self, "_valueForAttribute:");
  if (v4)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (a3 == 2005 && (isKindOfClass & 1) != 0)
    {
      long long v9 = 0uLL;
      AXValueGetValue((AXValueRef)[v4 firstObject], kAXValueTypeCFRange, &v9);
    }
    else
    {
      *(void *)&long long v9 = [v4 rangeValue];
      *((void *)&v9 + 1) = v6;
    }
  }
  else
  {
    long long v9 = xmmword_1BA6A62B0;
  }

  NSUInteger v8 = *((void *)&v9 + 1);
  NSUInteger v7 = v9;
  result.length = v8;
  result.location = v7;
  return result;
}

- (CGPath)pathWithAXAttribute:(int64_t)a3
{
  return 0;
}

- (CGRect)rectWithAXAttribute:(int64_t)a3
{
  uint64_t v3 = [(AXUIMockElement *)self _valueForAttribute:a3];
  [v3 rectValue];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (unint64_t)arrayCountWithAXAttribute:(int64_t)a3
{
  uint64_t v3 = [(AXUIMockElement *)self _valueForAttribute:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)objectWithAXAttribute:(int64_t)a3 parameter:(void *)a4
{
  double v6 = 0;
  if (a3 > 94008)
  {
    switch(a3)
    {
      case 95225:
        uint64_t v14 = 95225;
        goto LABEL_35;
      case 95226:
      case 95229:
      case 95233:
      case 95234:
      case 95235:
      case 95236:
      case 95237:
      case 95238:
      case 95245:
      case 95246:
      case 95247:
      case 95248:
      case 95249:
      case 95250:
      case 95251:
      case 95252:
        break;
      case 95227:
      case 95228:
      case 95230:
      case 95231:
      case 95232:
      case 95253:
LABEL_8:
        uint64_t v13 = -[AXUIMockElement objectWithAXAttribute:](self, "objectWithAXAttribute:");
        goto LABEL_36;
      case 95239:
        uint64_t v14 = 95239;
        goto LABEL_35;
      case 95240:
        uint64_t v14 = 95240;
        goto LABEL_35;
      case 95241:
        uint64_t v14 = 95241;
        goto LABEL_35;
      case 95242:
        uint64_t v14 = 95242;
        goto LABEL_35;
      case 95243:
        uint64_t v14 = 95243;
        goto LABEL_35;
      case 95244:
        uint64_t v14 = 95244;
        goto LABEL_35;
      default:
        if (a3 == 94009)
        {
          unint64_t v24 = [a4 unsignedIntegerValue];
          double v8 = [(AXUIMockElement *)self stringWithAXAttribute:2006];
          unint64_t v25 = [v8 length];
          long long valuePtr = xmmword_1BA6A62B0;
          unint64_t v26 = v25 - v24;
          if (v25 > v24)
          {
            unint64_t v27 = v25;
            v28 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
            uint64_t v29 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:range:", v28, 4, 0, v24);

            v30 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
            uint64_t v31 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:range:", v30, 0, v24, v26);

            if (v29 == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v32 = 0;
            }
            else {
              uint64_t v32 = v29;
            }
            if (v31 == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v33 = v27;
            }
            else {
              uint64_t v33 = v31;
            }
            *(void *)&long long valuePtr = v32;
            *((void *)&valuePtr + 1) = v33 - v32;
          }
          uint64_t v20 = (uint64_t)AXValueCreate(kAXValueTypeCFRange, &valuePtr);
LABEL_55:
          double v6 = (void *)v20;
          goto LABEL_63;
        }
        if (a3 == 94500)
        {
          uint64_t v14 = 94500;
LABEL_35:
          uint64_t v13 = [(AXUIMockElement *)self _valueForAttribute:v14];
LABEL_36:
          double v6 = (void *)v13;
        }
        break;
    }
  }
  else if (a3 <= 92502)
  {
    switch(a3)
    {
      case 2702:
        uint64_t v14 = 2702;
        goto LABEL_35;
      case 2703:
        uint64_t v14 = 2703;
        goto LABEL_35;
      case 2704:
        uint64_t v14 = 2704;
        goto LABEL_35;
      case 2705:
        uint64_t v14 = 2705;
        goto LABEL_35;
      case 2706:
        uint64_t v14 = 2706;
        goto LABEL_35;
      default:
        if (a3 == 3000) {
          goto LABEL_8;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 92503:
        if (![(AXUIMockElement *)self usesCarriageReturnAsLinesSeparator]) {
          goto LABEL_40;
        }
        long long valuePtr = *MEMORY[0x1E4F1DAD8];
        AXValueGetValue((AXValueRef)a4, kAXValueTypeCGPoint, &valuePtr);
        unint64_t v7 = [(AXUIMockElement *)self _lineNumberForPoint:valuePtr];
        double v8 = [(AXUIMockElement *)self _valueForAttribute:2006];
        double v9 = [v8 componentsSeparatedByString:@"\r"];
        if (v7 >= [v9 count])
        {
          double v6 = 0;
        }
        else
        {
          double v10 = (void *)MEMORY[0x1E4F1C9E8];
          double v11 = [NSNumber numberWithUnsignedInteger:v7];
          double v12 = [NSNumber numberWithUnsignedInteger:0];
          double v6 = objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, @"lineNumber", v12, @"lineColumn", 0);
        }
        goto LABEL_62;
      case 92504:
        if (![(AXUIMockElement *)self usesCarriageReturnAsLinesSeparator])
        {
LABEL_40:
          double v6 = 0;
          goto LABEL_37;
        }
        double v15 = [a4 objectForKey:@"lineNumber"];
        unint64_t v16 = [v15 unsignedIntegerValue];

        double v8 = [(AXUIMockElement *)self _valueForAttribute:2006];
        double v9 = [v8 componentsSeparatedByString:@"\r"];
        long long valuePtr = xmmword_1BA6A62B0;
        if (v16 < [v9 count])
        {
          if (v16)
          {
            v17 = objc_msgSend(v9, "subarrayWithRange:", 0, v16);
          }
          else
          {
            v17 = 0;
          }
          v36 = [v17 componentsJoinedByString:&stru_1F141B5A8];
          uint64_t v37 = [v36 length];
          v38 = [v9 objectAtIndex:v16];
          *(void *)&long long valuePtr = v37;
          *((void *)&valuePtr + 1) = [v38 length];
        }
        AXValueRef v35 = AXValueCreate(kAXValueTypeCFRange, &valuePtr);
        goto LABEL_61;
      case 92505:
        long long valuePtr = 0uLL;
        AXValueGetValue((AXValueRef)a4, kAXValueTypeCFRange, &valuePtr);
        double v8 = [(AXUIMockElement *)self stringWithAXAttribute:2006];
        NSRange v18 = (NSRange)valuePtr;
        v41.length = [v8 length];
        v41.location = 0;
        NSRange v19 = NSIntersectionRange(v18, v41);
        uint64_t v20 = objc_msgSend(v8, "substringWithRange:", v19.location, v19.length);
        goto LABEL_55;
      case 92506:
        uint64_t v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        goto LABEL_36;
      case 92507:
      case 92511:
      case 92512:
      case 92513:
      case 92514:
      case 92515:
      case 92516:
        goto LABEL_37;
      case 92508:
        long long valuePtr = 0uLL;
        AXValueGetValue((AXValueRef)a4, kAXValueTypeCFRange, &valuePtr);
        double v8 = [(AXUIMockElement *)self stringWithAXAttribute:2006];
        NSRange v21 = (NSRange)valuePtr;
        v42.length = [v8 length];
        v42.location = 0;
        NSRange v22 = NSIntersectionRange(v21, v42);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v20 = objc_msgSend(v8, "attributedSubstringFromRange:", v22.location, v22.length);
          goto LABEL_55;
        }
        id v34 = objc_allocWithZone((Class)AXAttributedString);
        double v9 = objc_msgSend(v8, "substringWithRange:", v22.location, v22.length);
        AXValueRef v35 = (AXValueRef)[v34 initWithString:v9];
LABEL_61:
        double v6 = v35;
LABEL_62:

        break;
      case 92509:
      case 92510:
        goto LABEL_8;
      case 92517:
        uint64_t v14 = 92517;
        goto LABEL_35;
      default:
        if (a3 == 92702) {
          goto LABEL_8;
        }
        if (a3 != 92704) {
          goto LABEL_37;
        }
        uint64_t v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 67, 14);
        goto LABEL_36;
    }
LABEL_63:
  }
LABEL_37:
  return v6;
}

- (id)cachedAttributes
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(NSMutableDictionary *)v2->_attributes copy];
  objc_sync_exit(v2);

  return v3;
}

- (id)copyCachedAttributes
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(NSMutableDictionary *)v2->_attributes ax_deepMutableCopy];
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)performAXAction:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  double v5 = [MEMORY[0x1E4F1CA98] null];
  performActionLog = self->_performActionLog;
  unint64_t v7 = [NSNumber numberWithUnsignedInt:v3];
  [(NSMutableDictionary *)performActionLog setObject:v5 forKeyedSubscript:v7];

  double v8 = [(AXUIMockElement *)self handleActionBlock];

  if (!v8) {
    return 0;
  }
  double v9 = [(AXUIMockElement *)self handleActionBlock];
  char v10 = v9[2](v9, v3, 0);

  return v10;
}

- (BOOL)performAXAction:(int)a3 withValue:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (v4 == 2505)
  {
    unint64_t v7 = [(AXUIMockElement *)self _valueForAttribute:2006];
    id v8 = v6;
    double v9 = [v8 objectForKeyedSubscript:@"range"];
    NSRange v10 = NSRangeFromString(v9);
    double v11 = [v8 objectForKeyedSubscript:@"replacement"];

    double v12 = objc_msgSend(v7, "stringByReplacingCharactersInRange:withString:", v10.location, v10.length, v11);
    [(AXUIMockElement *)self setValue:v12 forAXAttribute:2006];
  }
  performActionLog = self->_performActionLog;
  uint64_t v14 = [NSNumber numberWithUnsignedInt:v4];
  [(NSMutableDictionary *)performActionLog setObject:v6 forKeyedSubscript:v14];

  double v15 = [(AXUIMockElement *)self handleActionBlock];

  if (v15)
  {
    unint64_t v16 = [(AXUIMockElement *)self handleActionBlock];
    char v17 = ((uint64_t (**)(void, uint64_t, id))v16)[2](v16, v4, v6);
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (BOOL)performAXAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a3;
  id v7 = a4;
  id v8 = [(AXUIMockElement *)self handleActionBlock];

  if (v8)
  {
    double v9 = [(AXUIMockElement *)self handleActionBlock];
    char v10 = ((uint64_t (**)(void, uint64_t, id))v9)[2](v9, v5, v7);
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)previousElementsWithCount:(unint64_t)a3
{
  [(AXUIMockElement *)self updateCache:92502];
  return [(AXUIMockElement *)self _valueForAttribute:92502];
}

- (id)nextElementsWithCount:(unint64_t)a3
{
  [(AXUIMockElement *)self updateCache:92501];
  return [(AXUIMockElement *)self _valueForAttribute:92501];
}

- (id)nextElementsWithParameters:(id)a3
{
  [(AXUIMockElement *)self updateCache:92501];
  return [(AXUIMockElement *)self _valueForAttribute:92501];
}

- (id)previousElementsWithParameters:(id)a3
{
  [(AXUIMockElement *)self updateCache:92502];
  return [(AXUIMockElement *)self _valueForAttribute:92502];
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)isValidForApplication:(id)a3
{
  return 1;
}

- (int)pid
{
  return 0;
}

- (void)updateCache:(int64_t)a3
{
  uint64_t v5 = [(AXUIMockElement *)self cacheUpdatedCallback];

  if (v5)
  {
    id v6 = [(AXUIMockElement *)self cacheUpdatedCallback];
    v6[2](v6, self, a3);
  }
}

- (void)setAXAttribute:(int64_t)a3 withBOOL:(BOOL)a4
{
  BOOL v4 = a4;
  writableAttributes = self->_writableAttributes;
  id v8 = objc_msgSend(NSNumber, "numberWithLong:");
  double v9 = [(NSMutableDictionary *)writableAttributes objectForKeyedSubscript:v8];
  int v10 = [v9 BOOLValue];

  if (v10)
  {
    id v11 = [NSNumber numberWithBool:v4];
    [(AXUIMockElement *)self setValue:v11 forAXAttribute:a3];
  }
}

- (void)setAXAttribute:(int64_t)a3 withString:(id)a4
{
  id v10 = a4;
  writableAttributes = self->_writableAttributes;
  id v7 = [NSNumber numberWithLong:a3];
  id v8 = [(NSMutableDictionary *)writableAttributes objectForKeyedSubscript:v7];
  int v9 = [v8 BOOLValue];

  if (v9) {
    [(AXUIMockElement *)self setValue:v10 forAXAttribute:a3];
  }
}

- (void)setAXAttribute:(int64_t)a3 withLong:(int64_t)a4
{
  writableAttributes = self->_writableAttributes;
  id v8 = objc_msgSend(NSNumber, "numberWithLong:");
  int v9 = [(NSMutableDictionary *)writableAttributes objectForKeyedSubscript:v8];
  int v10 = [v9 BOOLValue];

  if (v10)
  {
    id v11 = [NSNumber numberWithLong:a4];
    [(AXUIMockElement *)self setValue:v11 forAXAttribute:a3];
  }
}

- (void)setAXAttribute:(int64_t)a3 withFloat:(float)a4
{
  writableAttributes = self->_writableAttributes;
  id v8 = objc_msgSend(NSNumber, "numberWithLong:");
  int v9 = [(NSMutableDictionary *)writableAttributes objectForKeyedSubscript:v8];
  int v10 = [v9 BOOLValue];

  if (v10)
  {
    *(float *)&double v11 = a4;
    id v12 = [NSNumber numberWithFloat:v11];
    [(AXUIMockElement *)self setValue:v12 forAXAttribute:a3];
  }
}

- (void)setAXAttribute:(int64_t)a3 withNumber:(id)a4
{
  id v10 = a4;
  writableAttributes = self->_writableAttributes;
  id v7 = [NSNumber numberWithLong:a3];
  id v8 = [(NSMutableDictionary *)writableAttributes objectForKeyedSubscript:v7];
  int v9 = [v8 BOOLValue];

  if (v9) {
    [(AXUIMockElement *)self setValue:v10 forAXAttribute:a3];
  }
}

- (void)setAXAttribute:(int64_t)a3 withPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  writableAttributes = self->_writableAttributes;
  int v9 = objc_msgSend(NSNumber, "numberWithLong:");
  id v10 = [(NSMutableDictionary *)writableAttributes objectForKeyedSubscript:v9];
  int v11 = [v10 BOOLValue];

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", x, y);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    [(AXUIMockElement *)self setValue:v12 forAXAttribute:a3];
  }
}

- (void)setAXAttribute:(int64_t)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  writableAttributes = self->_writableAttributes;
  int v9 = objc_msgSend(NSNumber, "numberWithLong:");
  id v10 = [(NSMutableDictionary *)writableAttributes objectForKeyedSubscript:v9];
  int v11 = [v10 BOOLValue];

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", width, height);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    [(AXUIMockElement *)self setValue:v12 forAXAttribute:a3];
  }
}

- (void)setAXAttribute:(int64_t)a3 withRange:(_NSRange)a4
{
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a4.location, a4.length);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(AXUIMockElement *)self setValue:v6 forAXAttribute:a3];
}

- (void)setAXAttribute:(int64_t)a3 withUIElement:(id)a4
{
  id v6 = a4;
  if ([(AXUIMockElement *)self canSetAXAttribute:a3]) {
    [(AXUIMockElement *)self setValue:v6 forAXAttribute:a3];
  }
}

- (void)setAXAttribute:(int64_t)a3 withUIElementArray:(id)a4
{
  id v6 = a4;
  if ([(AXUIMockElement *)self canSetAXAttribute:a3]) {
    [(AXUIMockElement *)self setValue:v6 forAXAttribute:a3];
  }
}

- (void)setAXAttribute:(int64_t)a3 withArray:(id)a4
{
  id v6 = a4;
  if ([(AXUIMockElement *)self canSetAXAttribute:a3]) {
    [(AXUIMockElement *)self setValue:v6 forAXAttribute:a3];
  }
}

- (void)setAXAttribute:(int64_t)a3 withObject:(id)a4
{
  id v6 = a4;
  if ([(AXUIMockElement *)self canSetAXAttribute:a3]) {
    [(AXUIMockElement *)self setValue:v6 forAXAttribute:a3];
  }
}

- (void)setAXAttribute:(int64_t)a3 withObject:(id)a4 synchronous:(BOOL)a5
{
  id v7 = a4;
  if ([(AXUIMockElement *)self canSetAXAttribute:a3]) {
    [(AXUIMockElement *)self setValue:v7 forAXAttribute:a3];
  }
}

- (CGPoint)pointForLineNumber:(unint64_t)a3
{
  double v3 = (double)a3 * 20.0;
  double v4 = 100.0;
  result.double y = v3;
  result.double x = v4;
  return result;
}

- (unint64_t)_lineNumberForPoint:(CGPoint)a3
{
  return vcvtpd_u64_f64(a3.y / 20.0);
}

- (unint64_t)hash
{
  double v3 = [(AXUIMockElement *)self stringWithAXAttribute:2001];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(AXUIMockElement *)self stringWithAXAttribute:2006];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)usesCarriageReturnAsLinesSeparator
{
  return self->_usesCarriageReturnAsLinesSeparator;
}

- (void)setUsesCarriageReturnAsLinesSeparator:(BOOL)a3
{
  self->_usesCarriageReturnAsLinesSeparator = a3;
}

- (NSMutableDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (BOOL)isApplication
{
  return self->_isApplication;
}

- (void)setIsApplication:(BOOL)a3
{
  self->_isApplication = a3;
}

- (id)handleActionBlock
{
  return self->_handleActionBlock;
}

- (void)setHandleActionBlock:(id)a3
{
}

- (id)cacheUpdatedCallback
{
  return self->_cacheUpdatedCallback;
}

- (void)setCacheUpdatedCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cacheUpdatedCallback, 0);
  objc_storeStrong(&self->_handleActionBlock, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_performActionLog, 0);
  objc_storeStrong((id *)&self->_writableAttributes, 0);
}

@end