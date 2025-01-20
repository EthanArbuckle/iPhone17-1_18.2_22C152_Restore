@interface TDMultisizeImageSetProduction
- (TDMultisizeImageSetProduction)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (void)processRendition:(id)a3 withBackstop:(id)a4;
@end

@implementation TDMultisizeImageSetProduction

- (TDMultisizeImageSetProduction)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TDMultisizeImageSetProduction;
  v4 = [(TDMultisizeImageSetProduction *)&v6 initWithEntity:a3 insertIntoManagedObjectContext:a4];
  [(TDMultisizeImageSetProduction *)v4 setMakeOpaqueIfPossible:1];
  return v4;
}

- (void)processRendition:(id)a3 withBackstop:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TDMultisizeImageSetProduction;
  -[TDNamedArtworkProduction processRendition:withBackstop:](&v8, sel_processRendition_withBackstop_);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDMultisizeImageSetProduction.m", 39, @"why is TDMultisizeImageSetProduction.m getting passed something else");
  }
  objc_msgSend(a4, "setSizeIndex:", objc_msgSend(a3, "sizeIndex"));
  objc_msgSend(a4, "setMultisizeImageSetRendition:", objc_msgSend(a3, "multisizeImageSetRendition"));
}

@end