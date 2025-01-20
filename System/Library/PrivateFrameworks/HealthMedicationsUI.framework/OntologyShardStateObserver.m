@interface OntologyShardStateObserver
- (void)ontologyStore:(id)a3 didImportEntry:(id)a4;
- (void)ontologyStore:(id)a3 didStageEntry:(id)a4;
- (void)ontologyStoreDidReconnect:(id)a3;
@end

@implementation OntologyShardStateObserver

- (void)ontologyStore:(id)a3 didStageEntry:(id)a4
{
}

- (void)ontologyStore:(id)a3 didImportEntry:(id)a4
{
}

- (void)ontologyStoreDidReconnect:(id)a3
{
  id v3 = a3;
  swift_retain();
  _s19HealthMedicationsUI26OntologyShardStateObserverC13ontologyStore12didReconnectySo010HKOntologyI0C_tF_0();

  swift_release();
}

@end