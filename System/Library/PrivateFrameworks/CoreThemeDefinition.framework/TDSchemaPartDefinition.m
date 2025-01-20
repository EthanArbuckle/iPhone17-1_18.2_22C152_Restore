@interface TDSchemaPartDefinition
- (CUIImage)previewImage;
- (NSArray)renditionGroups;
- (NSArray)renditions;
- (const)cuiPartDefinition;
- (id)_schema;
- (id)bestPreviewRendition;
- (id)displayName;
- (id)validStatesWithDocument:(id)a3;
- (int64_t)_renditionKeyValueForTokenIdentifier:(unsigned __int16)a3;
- (int64_t)elementID;
- (int64_t)partID;
- (unint64_t)partFeatures;
- (void)dealloc;
- (void)didTurnIntoFault;
- (void)setPartFeatures:(unint64_t)a3;
- (void)setPreviewImage:(id)a3;
- (void)setRenditionGroups:(id)a3;
- (void)setRenditions:(id)a3;
- (void)updateDerivedRenditionData;
@end

@implementation TDSchemaPartDefinition

- (void)dealloc
{
  [(TDSchemaPartDefinition *)self setPreviewImage:0];
  [(TDSchemaPartDefinition *)self setRenditionGroups:0];
  [(TDSchemaPartDefinition *)self setRenditions:0];
  v3.receiver = self;
  v3.super_class = (Class)TDSchemaPartDefinition;
  [(TDSchemaPartDefinition *)&v3 dealloc];
}

- (id)bestPreviewRendition
{
  return 0;
}

- (id)_schema
{
  int64_t v2 = +[CoreThemeDocument targetPlatformForMOC:[(TDSchemaPartDefinition *)self managedObjectContext]];
  objc_super v3 = (void *)MEMORY[0x263F383D0];

  return (id)[v3 schemaForPlatform:v2];
}

- (void)updateDerivedRenditionData
{
  id v3 = [(TDSchemaPartDefinition *)self _schema];
  v4 = [(TDSchemaPartDefinition *)self cuiPartDefinition];
  [(TDSchemaPartDefinition *)self element];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v3 schemaRenditionsForPartDefinition:v4];
  }
  else
  {
    [(TDSchemaPartDefinition *)self element];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v3 schemaEffectRenditionsForPartDefinition:v4];
    }
    else
    {
      [(TDSchemaPartDefinition *)self element];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [(TDSchemaPartDefinition *)self element];
        uint64_t v6 = objc_opt_class();
        NSLog(&cfstr_EncounteredUns.isa, v6);
        return;
      }
      uint64_t v5 = [v3 schemaMaterialRenditionsForPartDefinition:v4];
    }
  }
  [(TDSchemaPartDefinition *)self setRenditions:v5];
  -[TDSchemaPartDefinition setRenditionGroups:](self, "setRenditionGroups:", objc_msgSend(MEMORY[0x263F383E8], "renditionGroupsForRenditions:part:", -[TDSchemaPartDefinition renditions](self, "renditions"), v4));
  [(TDSchemaPartDefinition *)self setPartFeatures:v4->var4];

  [(TDSchemaPartDefinition *)self setPreviewImage:0];
}

- (id)validStatesWithDocument:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDSchemaPartDefinition.m", 139, @"Invalid parameter not satisfying: %@", @"document");
  }
  uint64_t v5 = (void *)[MEMORY[0x263EFF980] array];
  int v6 = [(TDSchemaPartDefinition *)self partFeatures];
  objc_msgSend(v5, "addObject:", objc_msgSend(a3, "stateWithIdentifier:", 0));
  if ((v6 & 0x1000) == 0)
  {
    if ((v6 & 0x100) != 0)
    {
      objc_msgSend(v5, "addObject:", objc_msgSend(a3, "stateWithIdentifier:", 1));
      if ((v6 & 0x800) != 0)
      {
LABEL_6:
        if ((v6 & 0x80000) != 0)
        {
LABEL_8:
          objc_msgSend(v5, "addObject:", objc_msgSend(a3, "stateWithIdentifier:", 4));
          goto LABEL_9;
        }
LABEL_7:
        objc_msgSend(v5, "addObject:", objc_msgSend(a3, "stateWithIdentifier:", 4));
        goto LABEL_8;
      }
    }
    else if ((v6 & 0x800) != 0)
    {
      goto LABEL_6;
    }
    objc_msgSend(v5, "addObject:", objc_msgSend(a3, "stateWithIdentifier:", 2));
    if ((v6 & 0x80000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_9:
  v7 = (void *)MEMORY[0x263EFF8C0];

  return (id)[v7 arrayWithArray:v5];
}

- (int64_t)_renditionKeyValueForTokenIdentifier:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (![(NSArray *)[(TDSchemaPartDefinition *)self renditions] count]) {
    [(TDSchemaPartDefinition *)self updateDerivedRenditionData];
  }
  if ([(NSArray *)[(TDSchemaPartDefinition *)self renditions] count]) {
    return objc_msgSend(-[NSArray objectAtIndex:](self->renditions, "objectAtIndex:", 0), "valueForTokenIdentifier:", v3);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDSchemaPartDefinition.m", 181, @"TDSchemaPartDefinition: unexpected value for CUIThemeAttributeName: %u", v3);
  return -1;
}

- (int64_t)elementID
{
  return CUIRenditionKeyValueForAttribute();
}

- (int64_t)partID
{
  return CUIRenditionKeyValueForAttribute();
}

- (id)displayName
{
  uint64_t v2 = (uint64_t)[(TDSchemaPartDefinition *)self cuiPartDefinition][8];
  uint64_t v3 = NSString;

  return (id)[v3 stringWithUTF8String:v2];
}

- (const)cuiPartDefinition
{
  uint64_t v3 = objc_msgSend((id)-[TDSchemaPartDefinition element](self, "element"), "name");
  uint64_t v4 = [(TDSchemaPartDefinition *)self name];
  id v5 = [(TDSchemaPartDefinition *)self _schema];
  [(TDSchemaPartDefinition *)self element];
  uint64_t v6 = [(id)objc_opt_class() elementDefinitionWithName:v3 withSchema:v5];

  return (const $44B639E4226C4F9A32E4AF5C4306E9A0 *)[v5 partDefinitionWithName:v4 forElementDefinition:v6];
}

- (CUIImage)previewImage
{
  result = self->previewImage;
  if (!result)
  {
    [(TDSchemaPartDefinition *)self updateDerivedRenditionData];
    return self->previewImage;
  }
  return result;
}

- (NSArray)renditions
{
  result = self->renditions;
  if (!result)
  {
    [(TDSchemaPartDefinition *)self updateDerivedRenditionData];
    return self->renditions;
  }
  return result;
}

- (NSArray)renditionGroups
{
  result = self->renditionGroups;
  if (!result)
  {
    [(TDSchemaPartDefinition *)self updateDerivedRenditionData];
    return self->renditionGroups;
  }
  return result;
}

- (unint64_t)partFeatures
{
  unint64_t result = self->partFeatures;
  if (!result)
  {
    [(TDSchemaPartDefinition *)self updateDerivedRenditionData];
    return self->partFeatures;
  }
  return result;
}

- (void)didTurnIntoFault
{
  v3.receiver = self;
  v3.super_class = (Class)TDSchemaPartDefinition;
  [(TDSchemaPartDefinition *)&v3 didTurnIntoFault];
  [(TDSchemaPartDefinition *)self setPreviewImage:0];
  [(TDSchemaPartDefinition *)self setRenditions:0];
  [(TDSchemaPartDefinition *)self setRenditionGroups:0];
  [(TDSchemaPartDefinition *)self setPartFeatures:0];
}

- (void)setPreviewImage:(id)a3
{
}

- (void)setRenditions:(id)a3
{
}

- (void)setRenditionGroups:(id)a3
{
}

- (void)setPartFeatures:(unint64_t)a3
{
  self->partFeatures = a3;
}

@end