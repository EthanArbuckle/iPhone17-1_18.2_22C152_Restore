@interface TDNamedEffectProduction
- (id)_nameAssociatedWithNameIdentifier:(unsigned int)a3;
- (id)displayName;
@end

@implementation TDNamedEffectProduction

- (id)_nameAssociatedWithNameIdentifier:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = (void *)[objc_alloc(MEMORY[0x263EFF260]) initWithEntityName:@"NamedElement"];
  uint64_t v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"identifier = %@", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v3)];
  v7 = (void *)[(TDNamedEffectProduction *)self managedObjectContext];
  [v5 setPredicate:v6];
  id v11 = 0;
  v8 = (void *)[v7 executeFetchRequest:v5 error:&v11];

  if (v11)
  {
    NSLog(&cfstr_UnableToLookup_2.isa, v3, [v11 localizedDescription]);
    return 0;
  }
  else
  {
    v10 = (void *)[v8 count];
    if (v10) {
      v10 = (void *)[v8 objectAtIndex:0];
    }
    return (id)[v10 name];
  }
}

- (id)displayName
{
  if ([(TDNamedEffectProduction *)self name]) {
    id v3 = (id)objc_msgSend((id)-[TDNamedEffectProduction name](self, "name"), "name");
  }
  else {
    id v3 = -[TDNamedEffectProduction _nameAssociatedWithNameIdentifier:](self, "_nameAssociatedWithNameIdentifier:", objc_msgSend((id)-[TDNamedEffectProduction baseKeySpec](self, "baseKeySpec"), "nameIdentifier"));
  }
  return (id)[NSString stringWithFormat:@"%@", v3];
}

@end