@interface TDRenditionKeySpec
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (const)key;
- (id)copyDataFromAttributes;
- (id)dataFromAttributes;
- (id)debugDescription;
- (id)keyDescription;
- (id)scaleFactorString;
- (int64_t)attributeCount;
- (unsigned)dimension1;
- (unsigned)dimension2;
- (unsigned)memoryClass;
- (unsigned)nameIdentifier;
- (unsigned)scaleFactor;
- (unsigned)subtype;
- (void)copyAttributesInto:(id)a3;
- (void)dealloc;
- (void)getKey:(_renditionkeytoken *)a3;
- (void)setAttributesFromCopyData:(id)a3;
- (void)setAttributesFromData:(id)a3;
- (void)setAttributesFromRenditionKey:(const _renditionkeytoken *)a3 withDocument:(id)a4;
- (void)setDimension1:(unsigned int)a3;
- (void)setDimension2:(unsigned int)a3;
- (void)setMemoryClass:(unsigned int)a3;
- (void)setNameIdentifier:(unsigned int)a3;
- (void)setScaleFactor:(unsigned int)a3;
- (void)setScaleFactorString:(id)a3;
- (void)setSubtype:(unsigned int)a3;
@end

@implementation TDRenditionKeySpec

- (void)dealloc
{
  scratchKey = self->_scratchKey;
  if (scratchKey) {
    free(scratchKey);
  }
  v4.receiver = self;
  v4.super_class = (Class)TDRenditionKeySpec;
  [(TDRenditionKeySpec *)&v4 dealloc];
}

- (void)setDimension1:(unsigned int)a3
{
  [(TDRenditionKeySpec *)self willChangeValueForKey:@"dimension1"];
  self->_dimension1 = a3;

  [(TDRenditionKeySpec *)self didChangeValueForKey:@"dimension1"];
}

- (unsigned)dimension1
{
  [(TDRenditionKeySpec *)self willAccessValueForKey:@"dimension1"];
  unsigned int dimension1 = self->_dimension1;
  [(TDRenditionKeySpec *)self didAccessValueForKey:@"dimension1"];
  return dimension1;
}

- (void)setDimension2:(unsigned int)a3
{
  [(TDRenditionKeySpec *)self willChangeValueForKey:@"dimension2"];
  self->_dimension2 = a3;

  [(TDRenditionKeySpec *)self didChangeValueForKey:@"dimension2"];
}

- (unsigned)dimension2
{
  [(TDRenditionKeySpec *)self willAccessValueForKey:@"dimension2"];
  unsigned int dimension2 = self->_dimension2;
  [(TDRenditionKeySpec *)self didAccessValueForKey:@"dimension2"];
  return dimension2;
}

- (void)setScaleFactor:(unsigned int)a3
{
  [(TDRenditionKeySpec *)self willChangeValueForKey:@"scaleFactor"];
  self->_scaleFactor = a3;

  [(TDRenditionKeySpec *)self didChangeValueForKey:@"scaleFactor"];
}

- (unsigned)scaleFactor
{
  [(TDRenditionKeySpec *)self willAccessValueForKey:@"scaleFactor"];
  unsigned int scaleFactor = self->_scaleFactor;
  [(TDRenditionKeySpec *)self didAccessValueForKey:@"scaleFactor"];
  return scaleFactor;
}

- (void)setSubtype:(unsigned int)a3
{
  [(TDRenditionKeySpec *)self willAccessValueForKey:@"subtype"];
  self->_subtype = a3;

  [(TDRenditionKeySpec *)self didAccessValueForKey:@"subtype"];
}

- (unsigned)subtype
{
  [(TDRenditionKeySpec *)self willAccessValueForKey:@"subtype"];
  unsigned int subtype = self->_subtype;
  [(TDRenditionKeySpec *)self didAccessValueForKey:@"subtype"];
  return subtype;
}

- (void)setNameIdentifier:(unsigned int)a3
{
  [(TDRenditionKeySpec *)self willAccessValueForKey:@"nameIdentifier"];
  self->_nameIdentifier = a3;

  [(TDRenditionKeySpec *)self didAccessValueForKey:@"nameIdentifier"];
}

- (unsigned)nameIdentifier
{
  [(TDRenditionKeySpec *)self willAccessValueForKey:@"nameIdentifier"];
  unsigned int nameIdentifier = self->_nameIdentifier;
  [(TDRenditionKeySpec *)self didAccessValueForKey:@"nameIdentifier"];
  return nameIdentifier;
}

- (void)setMemoryClass:(unsigned int)a3
{
  [(TDRenditionKeySpec *)self willAccessValueForKey:@"memoryClass"];
  self->_memoryClass = a3;

  [(TDRenditionKeySpec *)self didAccessValueForKey:@"memoryClass"];
}

- (unsigned)memoryClass
{
  [(TDRenditionKeySpec *)self willAccessValueForKey:@"memoryClass"];
  unsigned int memoryClass = self->_memoryClass;
  [(TDRenditionKeySpec *)self willAccessValueForKey:@"memoryClass"];
  return memoryClass;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___TDRenditionKeySpec;
  id v4 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingValueForKey_);
  if ([a3 isEqualToString:@"scaleFactorString"]) {
    return (id)objc_msgSend(v4, "setByAddingObjectsFromSet:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"scaleFactor", 0));
  }
  return v4;
}

- (id)scaleFactorString
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%u", -[TDRenditionKeySpec scaleFactor](self, "scaleFactor"));
}

- (void)setScaleFactorString:(id)a3
{
  uint64_t v4 = [a3 intValue];

  [(TDRenditionKeySpec *)self setScaleFactor:v4];
}

- (id)debugDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<element=%@  part=%@  identifier=%u size=%@  direction=%@  value=%@  state=%@  presentationState=%@ previousState=%@ previousValue=%@ dim1=%u  dim2=%u layer=%@ scale=%u idiom=%@ subtype=%u, gamut=%@, graphicsFeatureSetClass=%@, memoryClass=%u, sizeClassHorizontal=%@, sizeClassVertical=%@, target=%@, appearance=%@, localization=%@ glyphSize=%@ glyphWeight=%@ deploymentTarget=%@>", objc_msgSend((id)-[TDRenditionKeySpec element](self, "element"), "debugDescription"), objc_msgSend((id)-[TDRenditionKeySpec part](self, "part"), "debugDescription"), -[TDRenditionKeySpec nameIdentifier](self, "nameIdentifier"), objc_msgSend((id)-[TDRenditionKeySpec size](self, "size"), "debugDescription"), objc_msgSend((id)-[TDRenditionKeySpec direction](self, "direction"), "debugDescription"), objc_msgSend((id)-[TDRenditionKeySpec value](self, "value"), "debugDescription"), objc_msgSend((id)-[TDRenditionKeySpec state](self, "state"), "debugDescription"), objc_msgSend((id)-[TDRenditionKeySpec presentationState](self, "presentationState"), "debugDescription"), objc_msgSend((id)-[TDRenditionKeySpec previousState](self, "previousState"), "debugDescription"), objc_msgSend((id)-[TDRenditionKeySpec previousValue](self, "previousValue"), "debugDescription"), -[TDRenditionKeySpec dimension1](self, "dimension1"), -[TDRenditionKeySpec dimension2](self, "dimension2"), objc_msgSend((id)-[TDRenditionKeySpec layer](self, "layer"), "debugDescription"), -[TDRenditionKeySpec scaleFactor](self, "scaleFactor"), objc_msgSend((id)-[TDRenditionKeySpec idiom](self, "idiom"), "debugDescription"), -[TDRenditionKeySpec subtype](self, "subtype"),
               objc_msgSend((id)-[TDRenditionKeySpec gamut](self, "gamut"), "debugDescription"),
               objc_msgSend((id)-[TDRenditionKeySpec graphicsFeatureSetClass](self, "graphicsFeatureSetClass"), "debugDescription"), -[TDRenditionKeySpec memoryClass](self, "memoryClass"), objc_msgSend((id)-[TDRenditionKeySpec sizeClassHorizontal](self, "sizeClassHorizontal"), "debugDescription"), objc_msgSend((id)-[TDRenditionKeySpec sizeClassVertical](self, "sizeClassVertical"), "debugDescription"), objc_msgSend((id)-[TDRenditionKeySpec target](self, "target"), "debugDescription"), objc_msgSend((id)-[TDRenditionKeySpec appearance](self, "appearance"), "name"), objc_msgSend((id)-[TDRenditionKeySpec localization](self, "localization"), "name"), objc_msgSend((id)-[TDRenditionKeySpec glyphSize](self, "glyphSize"), "debugDescription"), objc_msgSend((id)-[TDRenditionKeySpec glyphWeight](self, "glyphWeight"), "debugDescription"), objc_msgSend((id)-[TDRenditionKeySpec target](self, "target"), "debugDescription"));
}

- (int64_t)attributeCount
{
  return [(TDRenditionKeySpec *)self keyFormat][8];
}

- (void)setAttributesFromRenditionKey:(const _renditionkeytoken *)a3 withDocument:(id)a4
{
  uint64_t identifier = a3->identifier;
  if (a3->identifier)
  {
    v7 = a3 + 1;
    do
    {
      uint64_t value = v7[-1].value;
      switch((int)identifier)
      {
        case 1:
          -[TDRenditionKeySpec setElement:](self, "setElement:", [a4 elementWithIdentifier:value]);
          break;
        case 2:
          -[TDRenditionKeySpec setPart:](self, "setPart:", [a4 partWithIdentifier:value]);
          break;
        case 3:
          -[TDRenditionKeySpec setSize:](self, "setSize:", [a4 sizeWithIdentifier:value]);
          break;
        case 4:
          -[TDRenditionKeySpec setDirection:](self, "setDirection:", [a4 directionWithIdentifier:value]);
          break;
        case 6:
          -[TDRenditionKeySpec setValue:](self, "setValue:", [a4 valueWithIdentifier:value]);
          break;
        case 7:
          -[TDRenditionKeySpec setAppearance:](self, "setAppearance:", [a4 appearanceWithIdentifier:value]);
          break;
        case 8:
          [(TDRenditionKeySpec *)self setDimension1:value];
          break;
        case 9:
          [(TDRenditionKeySpec *)self setDimension2:value];
          break;
        case 10:
          -[TDRenditionKeySpec setState:](self, "setState:", [a4 stateWithIdentifier:value]);
          break;
        case 11:
          -[TDRenditionKeySpec setLayer:](self, "setLayer:", [a4 drawingLayerWithIdentifier:value]);
          break;
        case 12:
          [(TDRenditionKeySpec *)self setScaleFactor:value];
          break;
        case 13:
          -[TDRenditionKeySpec setLocalization:](self, "setLocalization:", [a4 localizationWithIdentifier:value]);
          break;
        case 14:
          -[TDRenditionKeySpec setPresentationState:](self, "setPresentationState:", [a4 presentationStateWithIdentifier:value]);
          break;
        case 15:
          -[TDRenditionKeySpec setIdiom:](self, "setIdiom:", [a4 idiomWithIdentifier:value]);
          break;
        case 16:
          [(TDRenditionKeySpec *)self setSubtype:value];
          break;
        case 17:
          [(TDRenditionKeySpec *)self setNameIdentifier:value];
          break;
        case 18:
          -[TDRenditionKeySpec setPreviousValue:](self, "setPreviousValue:", [a4 valueWithIdentifier:value]);
          break;
        case 19:
          -[TDRenditionKeySpec setPreviousState:](self, "setPreviousState:", [a4 stateWithIdentifier:value]);
          break;
        case 20:
          -[TDRenditionKeySpec setSizeClassHorizontal:](self, "setSizeClassHorizontal:", [a4 sizeClassWithIdentifier:value]);
          break;
        case 21:
          -[TDRenditionKeySpec setSizeClassVertical:](self, "setSizeClassVertical:", [a4 sizeClassWithIdentifier:value]);
          break;
        case 22:
          [(TDRenditionKeySpec *)self setMemoryClass:value];
          break;
        case 23:
          -[TDRenditionKeySpec setGraphicsFeatureSetClass:](self, "setGraphicsFeatureSetClass:", [a4 graphicsFeatureSetClassWithIdentifier:value]);
          break;
        case 24:
          -[TDRenditionKeySpec setGamut:](self, "setGamut:", [a4 displayGamutWithIdentifier:value]);
          break;
        case 25:
          -[TDRenditionKeySpec setTarget:](self, "setTarget:", [a4 deploymentTargetWithIdentifier:value]);
          break;
        case 26:
          -[TDRenditionKeySpec setGlyphSize:](self, "setGlyphSize:", [a4 glyphSizeWithIdentifier:value]);
          break;
        case 27:
          -[TDRenditionKeySpec setGlyphWeight:](self, "setGlyphWeight:", [a4 glyphWeightWithIdentifier:value]);
          break;
        default:
          NSLog(&cfstr_UnexpectedAttr.isa, a2, value, identifier);
          break;
      }
      unsigned int v9 = v7->identifier;
      ++v7;
      uint64_t identifier = v9;
    }
    while (v9);
  }
}

- (void)getKey:(_renditionkeytoken *)a3
{
  *a3 = 0;
  objc_msgSend((id)-[TDRenditionKeySpec element](self, "element"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec part](self, "part"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec size](self, "size"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec direction](self, "direction"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec value](self, "value"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  [(TDRenditionKeySpec *)self dimension1];
  CUIRenditionKeySetValueForAttribute();
  [(TDRenditionKeySpec *)self dimension2];
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec state](self, "state"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec presentationState](self, "presentationState"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec layer](self, "layer"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  [(TDRenditionKeySpec *)self scaleFactor];
  CUIRenditionKeySetValueForAttribute();
  [(TDRenditionKeySpec *)self nameIdentifier];
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec idiom](self, "idiom"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  [(TDRenditionKeySpec *)self subtype];
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec previousState](self, "previousState"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec previousValue](self, "previousValue"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec sizeClassHorizontal](self, "sizeClassHorizontal"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec sizeClassVertical](self, "sizeClassVertical"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  [(TDRenditionKeySpec *)self memoryClass];
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec graphicsFeatureSetClass](self, "graphicsFeatureSetClass"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec gamut](self, "gamut"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec target](self, "target"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec appearance](self, "appearance"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec localization](self, "localization"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec glyphWeight](self, "glyphWeight"), "identifier");
  CUIRenditionKeySetValueForAttribute();
  objc_msgSend((id)-[TDRenditionKeySpec glyphSize](self, "glyphSize"), "identifier");

  CUIRenditionKeySetValueForAttribute();
}

- (const)key
{
  scratchKey = self->_scratchKey;
  if (!scratchKey)
  {
    uint64_t v4 = [(TDRenditionKeySpec *)self attributeCount];
    if (v4 < 22)
    {
      scratchKey = self->_scratchKey;
      if (!scratchKey) {
LABEL_6:
      }
        scratchKey = self->_stackScratchKey;
    }
    else
    {
      scratchKey = (_renditionkeytoken *)malloc_type_malloc(4 * v4 + 4, 0x100004052888210uLL);
      self->_scratchKey = scratchKey;
      if (!scratchKey) {
        goto LABEL_6;
      }
    }
  }
  [(TDRenditionKeySpec *)self getKey:scratchKey];
  return scratchKey;
}

- (id)keyDescription
{
  unint64_t v3 = +[CoreThemeDocument targetPlatformForMOC:[(TDRenditionKeySpec *)self managedObjectContext]];
  if (!v3)
  {
    v61 = NSString;
    uint64_t v60 = objc_msgSend((id)-[TDRenditionKeySpec element](self, "element"), "displayName");
    uint64_t v59 = objc_msgSend((id)-[TDRenditionKeySpec part](self, "part"), "displayName");
    uint64_t v58 = objc_msgSend((id)-[TDRenditionKeySpec size](self, "size"), "displayName");
    uint64_t v56 = objc_msgSend((id)-[TDRenditionKeySpec direction](self, "direction"), "displayName");
    uint64_t v54 = objc_msgSend((id)-[TDRenditionKeySpec value](self, "value"), "displayName");
    uint64_t v52 = [(TDRenditionKeySpec *)self nameIdentifier];
    uint64_t v50 = [(TDRenditionKeySpec *)self dimension1];
    uint64_t v48 = [(TDRenditionKeySpec *)self dimension2];
    uint64_t v46 = objc_msgSend((id)-[TDRenditionKeySpec state](self, "state"), "displayName");
    uint64_t v44 = objc_msgSend((id)-[TDRenditionKeySpec presentationState](self, "presentationState"), "displayName");
    uint64_t v42 = objc_msgSend((id)-[TDRenditionKeySpec previousState](self, "previousState"), "displayName");
    uint64_t v13 = objc_msgSend((id)-[TDRenditionKeySpec previousValue](self, "previousValue"), "displayName");
    uint64_t v14 = objc_msgSend((id)-[TDRenditionKeySpec layer](self, "layer"), "displayName");
    uint64_t v15 = [(TDRenditionKeySpec *)self scaleFactor];
    uint64_t v16 = objc_msgSend((id)-[TDRenditionKeySpec gamut](self, "gamut"), "displayName");
    uint64_t v17 = objc_msgSend((id)-[TDRenditionKeySpec target](self, "target"), "displayName");
    uint64_t v18 = objc_msgSend((id)-[TDRenditionKeySpec appearance](self, "appearance"), "name");
    uint64_t v19 = objc_msgSend((id)-[TDRenditionKeySpec localization](self, "localization"), "name");
    uint64_t v20 = objc_msgSend((id)-[TDRenditionKeySpec glyphWeight](self, "glyphWeight"), "displayName");
    uint64_t v39 = objc_msgSend((id)-[TDRenditionKeySpec glyphSize](self, "glyphSize"), "displayName");
    uint64_t v40 = objc_msgSend((id)-[TDRenditionKeySpec target](self, "target"), "displayName");
    uint64_t v37 = v19;
    uint64_t v38 = v20;
    uint64_t v35 = v17;
    uint64_t v36 = v18;
    uint64_t v33 = v15;
    uint64_t v34 = v16;
    uint64_t v31 = v13;
    uint64_t v32 = v14;
    uint64_t v29 = v44;
    uint64_t v30 = v42;
    uint64_t v28 = v46;
    uint64_t v27 = v48;
    uint64_t v26 = v50;
    uint64_t v25 = v52;
    uint64_t v24 = v54;
    uint64_t v23 = v56;
    uint64_t v22 = v58;
    v12 = @"(M)Key\n\telement:   \t%@\n\tpart:      \t%@\n\tsize:      \t%@\n\tdirection: \t%@\n\tvalue:     \t%@\n\tidentifier:\t%u\n\tdimension1:\t%u\n\tdimension2:\t%u\n\tstate:     \t%@\n\tpresentationState:     \t%@\n\tpreviousState:     \t%@\n\tpreviousValue:     \t%@\n\tlayer:     \t%@\n\tscale:     \t%u\n\tgamut:   \t%@\n\ttarget:    \t%@\n\tappearance:   \t%@\n\tlocalization:      \t%@\n\tglyphWeight:\t%@\n\ttglypSize: \t%@\n\tdeployment:   \t%@";
    return (id)objc_msgSend(v61, "stringWithFormat:", v12, v60, v59, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35,
                 v36,
                 v37,
                 v38,
                 v39,
                 v40);
  }
  if (v3 <= 5)
  {
    v61 = NSString;
    uint64_t v60 = objc_msgSend((id)-[TDRenditionKeySpec element](self, "element"), "displayName");
    uint64_t v59 = objc_msgSend((id)-[TDRenditionKeySpec part](self, "part"), "displayName");
    uint64_t v57 = objc_msgSend((id)-[TDRenditionKeySpec value](self, "value"), "displayName");
    uint64_t v55 = [(TDRenditionKeySpec *)self nameIdentifier];
    uint64_t v53 = [(TDRenditionKeySpec *)self dimension1];
    uint64_t v51 = objc_msgSend((id)-[TDRenditionKeySpec state](self, "state"), "displayName");
    uint64_t v49 = [(TDRenditionKeySpec *)self scaleFactor];
    uint64_t v47 = objc_msgSend((id)-[TDRenditionKeySpec idiom](self, "idiom"), "displayName");
    uint64_t v45 = [(TDRenditionKeySpec *)self subtype];
    uint64_t v43 = objc_msgSend((id)-[TDRenditionKeySpec gamut](self, "gamut"), "displayName");
    uint64_t v41 = objc_msgSend((id)-[TDRenditionKeySpec target](self, "target"), "displayName");
    uint64_t v4 = objc_msgSend((id)-[TDRenditionKeySpec sizeClassHorizontal](self, "sizeClassHorizontal"), "displayName");
    uint64_t v5 = objc_msgSend((id)-[TDRenditionKeySpec sizeClassVertical](self, "sizeClassVertical"), "displayName");
    uint64_t v6 = objc_msgSend((id)-[TDRenditionKeySpec graphicsFeatureSetClass](self, "graphicsFeatureSetClass"), "displayName");
    uint64_t v7 = [(TDRenditionKeySpec *)self memoryClass];
    uint64_t v8 = objc_msgSend((id)-[TDRenditionKeySpec target](self, "target"), "displayName");
    uint64_t v9 = objc_msgSend((id)-[TDRenditionKeySpec appearance](self, "appearance"), "name");
    uint64_t v10 = objc_msgSend((id)-[TDRenditionKeySpec localization](self, "localization"), "name");
    uint64_t v11 = objc_msgSend((id)-[TDRenditionKeySpec glyphWeight](self, "glyphWeight"), "displayName");
    uint64_t v39 = objc_msgSend((id)-[TDRenditionKeySpec glyphSize](self, "glyphSize"), "displayName");
    uint64_t v40 = objc_msgSend((id)-[TDRenditionKeySpec target](self, "target"), "displayName");
    uint64_t v37 = v10;
    uint64_t v38 = v11;
    uint64_t v35 = v8;
    uint64_t v36 = v9;
    uint64_t v33 = v6;
    uint64_t v34 = v7;
    uint64_t v31 = v4;
    uint64_t v32 = v5;
    uint64_t v29 = v43;
    uint64_t v30 = v41;
    uint64_t v28 = v45;
    uint64_t v27 = v47;
    uint64_t v26 = v49;
    uint64_t v25 = v51;
    uint64_t v24 = v53;
    uint64_t v23 = v55;
    uint64_t v22 = v57;
    v12 = @"(E)Key\n\telement:   \t%@\n\tpart:      \t%@\n\tvalue:     \t%@\n\tidentifier:\t%u\n\tdimension1:\t%u\n\tstate:     \t%@\n\tscale:     \t%u\n\tidiom:   \t%@\n\tsubtype:      \t%u\n\tgamut:   \t%@\n\ttarget:   \t%@\n\tsizeClassHorizontal:   \t%@\n\tsizeClassVertical:   \t%@\n\tgraphicsFeatureSetClass:      \t%@\n\tmemoryClass:      \t%u\n\ttarget:    \t%@\n\tappearance:      \t%@\n\tlocalization:      \t%@\n\tglyphWeight:\t%@\n\ttglypSize: \t%@\n\tdeployment:   \t%@";
    return (id)objc_msgSend(v61, "stringWithFormat:", v12, v60, v59, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35,
                 v36,
                 v37,
                 v38,
                 v39,
                 v40);
  }
  return 0;
}

- (void)copyAttributesInto:(id)a3
{
  objc_msgSend(a3, "setState:", -[TDRenditionKeySpec state](self, "state"));
  objc_msgSend(a3, "setPresentationState:", -[TDRenditionKeySpec presentationState](self, "presentationState"));
  objc_msgSend(a3, "setValue:", -[TDRenditionKeySpec value](self, "value"));
  objc_msgSend(a3, "setSize:", -[TDRenditionKeySpec size](self, "size"));
  objc_msgSend(a3, "setDirection:", -[TDRenditionKeySpec direction](self, "direction"));
  objc_msgSend(a3, "setPart:", -[TDRenditionKeySpec part](self, "part"));
  objc_msgSend(a3, "setElement:", -[TDRenditionKeySpec element](self, "element"));
  objc_msgSend(a3, "setLayer:", -[TDRenditionKeySpec layer](self, "layer"));
  objc_msgSend(a3, "setPreviousState:", -[TDRenditionKeySpec previousState](self, "previousState"));
  objc_msgSend(a3, "setPreviousValue:", -[TDRenditionKeySpec previousValue](self, "previousValue"));
  objc_msgSend(a3, "setNameIdentifier:", -[TDRenditionKeySpec nameIdentifier](self, "nameIdentifier"));
  objc_msgSend(a3, "setDimension1:", -[TDRenditionKeySpec dimension1](self, "dimension1"));
  objc_msgSend(a3, "setDimension2:", -[TDRenditionKeySpec dimension2](self, "dimension2"));
  objc_msgSend(a3, "setScaleFactor:", -[TDRenditionKeySpec scaleFactor](self, "scaleFactor"));
  objc_msgSend(a3, "setIdiom:", -[TDRenditionKeySpec idiom](self, "idiom"));
  objc_msgSend(a3, "setSubtype:", -[TDRenditionKeySpec subtype](self, "subtype"));
  objc_msgSend(a3, "setGamut:", -[TDRenditionKeySpec gamut](self, "gamut"));
  objc_msgSend(a3, "setTarget:", -[TDRenditionKeySpec target](self, "target"));
  objc_msgSend(a3, "setSizeClassHorizontal:", -[TDRenditionKeySpec sizeClassHorizontal](self, "sizeClassHorizontal"));
  objc_msgSend(a3, "setSizeClassVertical:", -[TDRenditionKeySpec sizeClassVertical](self, "sizeClassVertical"));
  objc_msgSend(a3, "setMemoryClass:", -[TDRenditionKeySpec memoryClass](self, "memoryClass"));
  objc_msgSend(a3, "setGraphicsFeatureSetClass:", -[TDRenditionKeySpec graphicsFeatureSetClass](self, "graphicsFeatureSetClass"));
  objc_msgSend(a3, "setAppearance:", -[TDRenditionKeySpec appearance](self, "appearance"));
  objc_msgSend(a3, "setLocalization:", -[TDRenditionKeySpec localization](self, "localization"));
  objc_msgSend(a3, "setGlyphSize:", -[TDRenditionKeySpec glyphSize](self, "glyphSize"));
  uint64_t v5 = [(TDRenditionKeySpec *)self glyphWeight];

  [a3 setGlyphWeight:v5];
}

- (id)dataFromAttributes
{
  unint64_t v3 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:6];
  uint64_t v4 = (void *)[(TDRenditionKeySpec *)self state];
  if (v4) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "objectID"), "URIRepresentation"), "absoluteString"), @"state");
  }
  uint64_t v5 = (void *)[(TDRenditionKeySpec *)self presentationState];
  if (v5) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "objectID"), "URIRepresentation"), "absoluteString"), @"presentationState");
  }
  uint64_t v6 = (void *)[(TDRenditionKeySpec *)self value];
  if (v6) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "objectID"), "URIRepresentation"), "absoluteString"), @"value");
  }
  uint64_t v7 = (void *)[(TDRenditionKeySpec *)self size];
  if (v7) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "objectID"), "URIRepresentation"), "absoluteString"), @"size");
  }
  uint64_t v8 = (void *)[(TDRenditionKeySpec *)self direction];
  if (v8) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "objectID"), "URIRepresentation"), "absoluteString"), @"direction");
  }
  uint64_t v9 = (void *)[(TDRenditionKeySpec *)self part];
  if (v9) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "objectID"), "URIRepresentation"), "absoluteString"), @"part");
  }
  uint64_t v10 = (void *)[(TDRenditionKeySpec *)self element];
  if (v10) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "objectID"), "URIRepresentation"), "absoluteString"), @"element");
  }
  uint64_t v11 = (void *)[(TDRenditionKeySpec *)self layer];
  if (v11) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "objectID"), "URIRepresentation"), "absoluteString"), @"layer");
  }
  v12 = (void *)[(TDRenditionKeySpec *)self idiom];
  if (v12) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "objectID"), "URIRepresentation"), "absoluteString"), @"idiom");
  }
  uint64_t v13 = (void *)[(TDRenditionKeySpec *)self gamut];
  if (v13) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "objectID"), "URIRepresentation"), "absoluteString"), @"gamut");
  }
  uint64_t v14 = (void *)[(TDRenditionKeySpec *)self target];
  if (v14) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "objectID"), "URIRepresentation"), "absoluteString"), @"target");
  }
  uint64_t v15 = (void *)[(TDRenditionKeySpec *)self graphicsFeatureSetClass];
  if (v15) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "objectID"), "URIRepresentation"), "absoluteString"), @"graphicsFeatureSetClass");
  }
  uint64_t v16 = (void *)[(TDRenditionKeySpec *)self sizeClassHorizontal];
  if (v16) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v16, "objectID"), "URIRepresentation"), "absoluteString"), @"sizeClassHorizontal");
  }
  uint64_t v17 = (void *)[(TDRenditionKeySpec *)self sizeClassVertical];
  if (v17) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "objectID"), "URIRepresentation"), "absoluteString"), @"sizeClassVertical");
  }
  uint64_t v18 = (void *)[(TDRenditionKeySpec *)self previousState];
  if (v18) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "objectID"), "URIRepresentation"), "absoluteString"), @"previousState");
  }
  uint64_t v19 = (void *)[(TDRenditionKeySpec *)self previousValue];
  if (v19) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v19, "objectID"), "URIRepresentation"), "absoluteString"), @"previousValue");
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", -[TDRenditionKeySpec subtype](self, "subtype")), @"subtype");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", -[TDRenditionKeySpec nameIdentifier](self, "nameIdentifier")), @"nameIdentifier");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", -[TDRenditionKeySpec dimension1](self, "dimension1")), @"dimension1");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", -[TDRenditionKeySpec dimension2](self, "dimension2")), @"dimension2");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", -[TDRenditionKeySpec scaleFactor](self, "scaleFactor")), @"scaleFactor");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[TDRenditionKeySpec memoryClass](self, "memoryClass")), @"memoryClass");
  uint64_t v20 = (void *)[(TDRenditionKeySpec *)self appearance];
  if (v20) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "objectID"), "URIRepresentation"), "absoluteString"), @"appearance");
  }
  v21 = (void *)[(TDRenditionKeySpec *)self localization];
  if (v21) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v21, "objectID"), "URIRepresentation"), "absoluteString"), @"localization");
  }
  uint64_t v22 = (void *)MEMORY[0x263F08AC0];

  return (id)[v22 dataWithPropertyList:v3 format:200 options:0 error:0];
}

- (void)setAttributesFromData:(id)a3
{
  uint64_t v4 = (void *)[MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:0];
  uint64_t v5 = (void *)[(TDRenditionKeySpec *)self managedObjectContext];
  uint64_t v6 = [v4 objectForKey:@"state"];
  if (v6) {
    -[TDRenditionKeySpec setState:](self, "setState:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(NSURL, "URLWithString:", v6))));
  }
  uint64_t v7 = [v4 objectForKey:@"previousState"];
  if (v7) {
    -[TDRenditionKeySpec setPreviousState:](self, "setPreviousState:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(NSURL, "URLWithString:", v7))));
  }
  uint64_t v8 = [v4 objectForKey:@"presentationState"];
  if (v8) {
    -[TDRenditionKeySpec setPresentationState:](self, "setPresentationState:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(NSURL, "URLWithString:", v8))));
  }
  uint64_t v9 = [v4 objectForKey:@"value"];
  if (v9) {
    -[TDRenditionKeySpec setValue:](self, "setValue:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(NSURL, "URLWithString:", v9))));
  }
  uint64_t v10 = [v4 objectForKey:@"previousValue"];
  if (v10) {
    -[TDRenditionKeySpec setPreviousValue:](self, "setPreviousValue:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(NSURL, "URLWithString:", v10))));
  }
  uint64_t v11 = [v4 objectForKey:@"size"];
  if (v11) {
    -[TDRenditionKeySpec setSize:](self, "setSize:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(NSURL, "URLWithString:", v11))));
  }
  uint64_t v12 = [v4 objectForKey:@"direction"];
  if (v12) {
    -[TDRenditionKeySpec setDirection:](self, "setDirection:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(NSURL, "URLWithString:", v12))));
  }
  uint64_t v13 = [v4 objectForKey:@"part"];
  if (v13) {
    -[TDRenditionKeySpec setPart:](self, "setPart:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(NSURL, "URLWithString:", v13))));
  }
  uint64_t v14 = [v4 objectForKey:@"element"];
  if (v14) {
    -[TDRenditionKeySpec setElement:](self, "setElement:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(NSURL, "URLWithString:", v14))));
  }
  uint64_t v15 = [v4 objectForKey:@"layer"];
  if (v15) {
    -[TDRenditionKeySpec setLayer:](self, "setLayer:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(NSURL, "URLWithString:", v15))));
  }
  uint64_t v16 = [v4 objectForKey:@"idiom"];
  if (v16) {
    -[TDRenditionKeySpec setIdiom:](self, "setIdiom:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(NSURL, "URLWithString:", v16))));
  }
  uint64_t v17 = [v4 objectForKey:@"gamut"];
  if (v17) {
    -[TDRenditionKeySpec setGamut:](self, "setGamut:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(NSURL, "URLWithString:", v17))));
  }
  uint64_t v18 = [v4 objectForKey:@"target"];
  if (v18) {
    -[TDRenditionKeySpec setTarget:](self, "setTarget:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(NSURL, "URLWithString:", v18))));
  }
  uint64_t v19 = [v4 objectForKey:@"graphicsFeatureSetClass"];
  if (v19) {
    -[TDRenditionKeySpec setGraphicsFeatureSetClass:](self, "setGraphicsFeatureSetClass:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(NSURL, "URLWithString:", v19))));
  }
  uint64_t v20 = [v4 objectForKey:@"sizeClassHorizontal"];
  if (v20) {
    -[TDRenditionKeySpec setSizeClassHorizontal:](self, "setSizeClassHorizontal:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(NSURL, "URLWithString:", v20))));
  }
  uint64_t v21 = [v4 objectForKey:@"sizeClassVertical"];
  if (v21) {
    -[TDRenditionKeySpec setSizeClassVertical:](self, "setSizeClassVertical:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(NSURL, "URLWithString:", v21))));
  }
  uint64_t v22 = (void *)[v4 objectForKey:@"subtype"];
  if (v22) {
    -[TDRenditionKeySpec setSubtype:](self, "setSubtype:", [v22 intValue]);
  }
  uint64_t v23 = (void *)[v4 objectForKey:@"dimension1"];
  if (v23) {
    -[TDRenditionKeySpec setDimension1:](self, "setDimension1:", [v23 intValue]);
  }
  uint64_t v24 = (void *)[v4 objectForKey:@"nameIdentifier"];
  if (v24) {
    -[TDRenditionKeySpec setNameIdentifier:](self, "setNameIdentifier:", [v24 intValue]);
  }
  uint64_t v25 = (void *)[v4 objectForKey:@"dimension2"];
  if (v25) {
    -[TDRenditionKeySpec setDimension2:](self, "setDimension2:", [v25 intValue]);
  }
  uint64_t v26 = (void *)[v4 objectForKey:@"scaleFactor"];
  if (v26) {
    -[TDRenditionKeySpec setScaleFactor:](self, "setScaleFactor:", [v26 intValue]);
  }
  uint64_t v27 = [v4 objectForKeyedSubscript:@"memoryClass"];
  if (v27) {
    [(TDRenditionKeySpec *)self setMemoryClass:v27];
  }
  uint64_t v28 = [v4 objectForKey:@"appearance"];
  if (v28) {
    -[TDRenditionKeySpec setAppearance:](self, "setAppearance:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(NSURL, "URLWithString:", v28))));
  }
  uint64_t v29 = [v4 objectForKey:@"localization"];
  if (v29)
  {
    uint64_t v30 = objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(NSURL, "URLWithString:", v29)));
    [(TDRenditionKeySpec *)self setLocalization:v30];
  }
}

- (id)copyDataFromAttributes
{
  unint64_t v3 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
  uint64_t v4 = [(TDRenditionKeySpec *)self valueForKey:@"dimension1"];
  if (v4) {
    [v3 setObject:v4 forKey:@"dimension1"];
  }
  uint64_t v5 = [(TDRenditionKeySpec *)self valueForKey:@"nameIdentifier"];
  if (v5) {
    [v3 setObject:v5 forKey:@"nameIdentifier"];
  }
  uint64_t v6 = [(TDRenditionKeySpec *)self valueForKey:@"dimension2"];
  if (v6) {
    [v3 setObject:v6 forKey:@"dimension2"];
  }
  uint64_t v7 = [(TDRenditionKeySpec *)self valueForKey:@"scaleFactor"];
  if (v7) {
    [v3 setObject:v7 forKey:@"scaleFactor"];
  }
  uint64_t v8 = [(TDRenditionKeySpec *)self valueForKey:@"subtype"];
  if (v8) {
    [v3 setObject:v8 forKey:@"subtype"];
  }
  uint64_t v9 = (void *)[(TDRenditionKeySpec *)self valueForKey:@"direction"];
  if (v9) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "identifier")), @"direction");
  }
  uint64_t v10 = (void *)[(TDRenditionKeySpec *)self valueForKey:@"layer"];
  if (v10) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "identifier")), @"layer");
  }
  uint64_t v11 = (void *)[(TDRenditionKeySpec *)self valueForKey:@"size"];
  if (v11) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "identifier")), @"size");
  }
  uint64_t v12 = (void *)[(TDRenditionKeySpec *)self valueForKey:@"state"];
  if (v12) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "identifier")), @"state");
  }
  uint64_t v13 = (void *)[(TDRenditionKeySpec *)self valueForKey:@"previousState"];
  if (v13) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v13, "identifier")), @"previousState");
  }
  uint64_t v14 = (void *)[(TDRenditionKeySpec *)self valueForKey:@"presentationState"];
  if (v14) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v14, "identifier")), @"presentationState");
  }
  uint64_t v15 = (void *)[(TDRenditionKeySpec *)self valueForKey:@"idiom"];
  if (v15) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "identifier")), @"idiom");
  }
  uint64_t v16 = (void *)[(TDRenditionKeySpec *)self valueForKey:@"gamut"];
  if (v16) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v16, "identifier")), @"gamut");
  }
  uint64_t v17 = (void *)[(TDRenditionKeySpec *)self valueForKey:@"graphicsFeatureSetClass"];
  if (v17) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v17, "identifier")), @"graphicsFeatureSetClass");
  }
  uint64_t v18 = (void *)[(TDRenditionKeySpec *)self valueForKey:@"sizeClassHorizontal"];
  if (v18) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v18, "identifier")), @"sizeClassHorizontal");
  }
  uint64_t v19 = (void *)[(TDRenditionKeySpec *)self valueForKey:@"sizeClassVertical"];
  if (v19) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v19, "identifier")), @"sizeClassVertical");
  }
  uint64_t v20 = (void *)[(TDRenditionKeySpec *)self valueForKey:@"value"];
  if (v20) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v20, "identifier")), @"value");
  }
  uint64_t v21 = (void *)[(TDRenditionKeySpec *)self valueForKey:@"previousValue"];
  if (v21) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v21, "identifier")), @"previousValue");
  }
  uint64_t v22 = (void *)[(TDRenditionKeySpec *)self valueForKey:@"element"];
  if (v22) {
    objc_msgSend(v3, "setObject:forKey:", (id)objc_msgSend(v22, "copyDataFromAttributes"), @"element");
  }
  uint64_t v23 = (void *)[(TDRenditionKeySpec *)self valueForKey:@"part"];
  if (v23) {
    objc_msgSend(v3, "setObject:forKey:", (id)objc_msgSend(v23, "copyDataFromAttributes"), @"part");
  }
  uint64_t v24 = [(TDRenditionKeySpec *)self valueForKey:@"appearance"];
  if (v24) {
    [v3 setObject:v24 forKey:@"appearance"];
  }
  uint64_t v25 = [(TDRenditionKeySpec *)self valueForKey:@"localization"];
  if (v25) {
    [v3 setObject:v25 forKey:@"localization"];
  }
  uint64_t v26 = (void *)[MEMORY[0x263F08AC0] dataWithPropertyList:v3 format:200 options:0 error:0];

  return (id)[v26 copy];
}

- (void)setAttributesFromCopyData:(id)a3
{
  uint64_t v4 = (void *)[MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:0];
  uint64_t v5 = (void *)[v4 objectForKey:@"nameIdentifier"];
  if (v5) {
    -[TDRenditionKeySpec setNameIdentifier:](self, "setNameIdentifier:", [v5 intValue]);
  }
  uint64_t v6 = (void *)[v4 objectForKey:@"dimension1"];
  if (v6) {
    -[TDRenditionKeySpec setDimension1:](self, "setDimension1:", [v6 intValue]);
  }
  uint64_t v7 = (void *)[v4 objectForKey:@"dimension2"];
  if (v7) {
    -[TDRenditionKeySpec setDimension2:](self, "setDimension2:", [v7 intValue]);
  }
  uint64_t v8 = (void *)[v4 objectForKey:@"scaleFactor"];
  if (v8) {
    -[TDRenditionKeySpec setScaleFactor:](self, "setScaleFactor:", [v8 intValue]);
  }
  uint64_t v9 = (void *)[v4 objectForKey:@"subtype"];
  if (v9) {
    -[TDRenditionKeySpec setSubtype:](self, "setSubtype:", [v9 intValue]);
  }
  uint64_t v10 = [v4 objectForKeyedSubscript:@"memoryClass"];
  if (v10)
  {
    [(TDRenditionKeySpec *)self setMemoryClass:v10];
  }
}

@end