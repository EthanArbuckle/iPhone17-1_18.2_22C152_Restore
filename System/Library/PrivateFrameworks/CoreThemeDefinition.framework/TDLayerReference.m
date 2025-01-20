@interface TDLayerReference
- (id)cuiLayerReference;
@end

@implementation TDLayerReference

- (id)cuiLayerReference
{
  id v3 = objc_alloc_init(MEMORY[0x263F383C0]);
  v4 = objc_msgSend((id)-[TDLayerReference reference](self, "reference"), "baseKeySpec");
  objc_msgSend(v3, "setLayerName:", -[TDLayerReference name](self, "name"));
  [(TDAbstractLayerReference *)self frameRect];
  objc_msgSend(v3, "setFrame:");
  objc_msgSend((id)-[TDLayerReference opacity](self, "opacity"), "floatValue");
  [v3 setOpacity:v5];
  objc_msgSend(v3, "setBlendMode:", objc_msgSend((id)-[TDLayerReference blendMode](self, "blendMode"), "intValue"));
  v6 = objc_msgSend(objc_alloc(MEMORY[0x263F383B8]), "initWithKeyList:", objc_msgSend(v4, "key"));
  [v3 setReferenceKey:v6];

  objc_msgSend((id)objc_msgSend(v3, "referenceKey"), "setThemeScale:", 0);
  return v3;
}

@end