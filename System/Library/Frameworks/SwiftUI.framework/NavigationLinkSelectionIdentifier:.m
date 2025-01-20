@interface NavigationLinkSelectionIdentifier:
- (void)UpdateViewDestinationRequest;
@end

@implementation NavigationLinkSelectionIdentifier:

- (void)UpdateViewDestinationRequest
{
  if (!lazy cache variable for type metadata for [NavigationLinkSelectionIdentifier : UpdateViewDestinationRequest])
  {
    lazy protocol witness table accessor for type NavigationLinkSelectionIdentifier and conformance NavigationLinkSelectionIdentifier();
    unint64_t v0 = type metadata accessor for Dictionary();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [NavigationLinkSelectionIdentifier : UpdateViewDestinationRequest]);
    }
  }
}

@end