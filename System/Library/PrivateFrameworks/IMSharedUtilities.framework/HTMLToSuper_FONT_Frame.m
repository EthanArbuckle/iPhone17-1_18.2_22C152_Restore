@interface HTMLToSuper_FONT_Frame
- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7;
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation HTMLToSuper_FONT_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  id v20 = (id)IMCopyNormalizedAttributes(a8, 1, 0);
  uint64_t v10 = [v20 objectForKey:@"face"];
  v11 = (void *)[v20 objectForKey:@"absz"];
  v12 = (void *)[v20 objectForKey:@"size"];
  if (v11)
  {
    uint64_t v13 = [v11 integerValue];
LABEL_3:
    uint64_t v14 = [NSNumber numberWithInteger:v13];
    goto LABEL_4;
  }
  v15 = v12;
  uint64_t v16 = [v12 length];
  if (v16 == 1)
  {
    int v18 = [v15 characterAtIndex:0];
  }
  else
  {
    if (v16 == 2)
    {
      int v17 = [v15 characterAtIndex:0];
      int v18 = [v15 characterAtIndex:1];
      goto LABEL_17;
    }
    int v18 = 0;
  }
  int v17 = 1;
LABEL_17:
  uint64_t v14 = 0;
  int v19 = v17 * v18;
  if (v17 * v18 > 2106)
  {
    if (v19 > 2204)
    {
      switch(v19)
      {
        case 2205:
LABEL_31:
          uint64_t v13 = 10;
          goto LABEL_3;
        case 2295:
          uint64_t v13 = 6;
          goto LABEL_3;
        case 2250:
LABEL_28:
          uint64_t v13 = 8;
          goto LABEL_3;
      }
    }
    else
    {
      switch(v19)
      {
        case 2107:
LABEL_29:
          uint64_t v13 = 14;
          goto LABEL_3;
        case 2150:
LABEL_30:
          uint64_t v13 = 18;
          goto LABEL_3;
        case 2193:
LABEL_24:
          uint64_t v13 = 24;
          goto LABEL_3;
      }
    }
  }
  else
  {
    switch(v19)
    {
      case '1':
        goto LABEL_28;
      case '2':
        goto LABEL_31;
      case '3':
        uint64_t v13 = 12;
        goto LABEL_3;
      case '4':
        goto LABEL_29;
      case '5':
        goto LABEL_30;
      case '6':
        goto LABEL_24;
      case '7':
        uint64_t v13 = 36;
        goto LABEL_3;
      default:
        break;
    }
  }
LABEL_4:
  if (v10)
  {
    [a4 pushFontFamily:v10];
    self->_shouldPopFontName = 1;
  }
  if (v14)
  {
    [a4 pushFontSize:v14];
    self->_shouldPopFontSize = 1;
  }
}

- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7
{
  if (self->_shouldPopFontName) {
    objc_msgSend(a4, "popFontFamily", a3, a4, a5, a6, a7);
  }
  if (self->_shouldPopFontSize)
  {
    MEMORY[0x1F4181798](a4, sel_popFontSize);
  }
}

@end