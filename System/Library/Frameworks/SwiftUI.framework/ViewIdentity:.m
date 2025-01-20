@interface ViewIdentity:
- (void)AlertStorage;
- (void)ConfirmationDialog;
@end

@implementation ViewIdentity:

- (void)AlertStorage
{
  if (!lazy cache variable for type metadata for [ViewIdentity : AlertStorage])
  {
    lazy protocol witness table accessor for type ViewIdentity and conformance ViewIdentity();
    unint64_t v0 = type metadata accessor for Dictionary();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [ViewIdentity : AlertStorage]);
    }
  }
}

- (void)ConfirmationDialog
{
  if (!lazy cache variable for type metadata for [ViewIdentity : ConfirmationDialog])
  {
    lazy protocol witness table accessor for type ViewIdentity and conformance ViewIdentity();
    unint64_t v0 = type metadata accessor for Dictionary();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [ViewIdentity : ConfirmationDialog]);
    }
  }
}

@end