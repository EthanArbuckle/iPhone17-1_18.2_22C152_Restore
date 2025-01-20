@interface MapsSuggestionsRealPortraitConnector
- (BOOL)iterRankedLocationsWithQuery:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)iterRecentLocationsForConsumer:(unint64_t)a3 criteria:(id)a4 limit:(unint64_t)a5 client:(id)a6 error:(id *)a7 block:(id)a8;
- (BOOL)iterScoredEventsWithQuery:(id)a3 error:(id *)a4 block:(id)a5;
- (MapsSuggestionsRealPortraitConnector)init;
- (id)locationQuery:(unint64_t)a3 fromDate:(id)a4 consumerType:(unint64_t)a5;
- (id)namedEntityQuery:(unint64_t)a3 fromDate:(id)a4 consumerType:(unint64_t)a5;
- (id)rankedNamedEntitiesWihQuery:(id)a3 error:(id *)a4;
- (void)connectionsStore_registerFeedback:(id)a3 clientIdentifier:(id)a4 completion:(id)a5;
- (void)locationStore_registerFeedback:(id)a3 clientIdentifier:(id)a4 completion:(id)a5;
- (void)namedEntityStore_registerFeedback:(id)a3 clientIdentifier:(id)a4 completion:(id)a5;
@end

@implementation MapsSuggestionsRealPortraitConnector

- (MapsSuggestionsRealPortraitConnector)init
{
  v12.receiver = self;
  v12.super_class = (Class)MapsSuggestionsRealPortraitConnector;
  v2 = [(MapsSuggestionsRealPortraitConnector *)&v12 init];
  if (v2)
  {
    v3 = (PPLocationStore *)objc_alloc_init(MEMORY[0x1E4F89E68]);
    locationStore = v2->_locationStore;
    v2->_locationStore = v3;

    [(PPLocationStore *)v2->_locationStore setClientIdentifier:@"maps"];
    v5 = (PPConnectionsStore *)objc_alloc_init(MEMORY[0x1E4F89DC8]);
    connectionsStore = v2->_connectionsStore;
    v2->_connectionsStore = v5;

    [(PPConnectionsStore *)v2->_connectionsStore setClientIdentifier:@"maps"];
    v7 = (PPNamedEntityStore *)objc_alloc_init(MEMORY[0x1E4F89EB0]);
    namedEntityStore = v2->_namedEntityStore;
    v2->_namedEntityStore = v7;

    [(PPNamedEntityStore *)v2->_namedEntityStore setClientIdentifier:@"maps"];
    v9 = (PPEventStore *)objc_alloc_init(MEMORY[0x1E4F89E18]);
    eventStore = v2->_eventStore;
    v2->_eventStore = v9;

    [(PPEventStore *)v2->_eventStore setClientIdentifier:@"maps"];
  }
  return v2;
}

- (BOOL)iterScoredEventsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  return [(PPEventStore *)self->_eventStore iterScoredEventsWithQuery:a3 error:a4 block:a5];
}

- (BOOL)iterRecentLocationsForConsumer:(unint64_t)a3 criteria:(id)a4 limit:(unint64_t)a5 client:(id)a6 error:(id *)a7 block:(id)a8
{
  return [(PPConnectionsStore *)self->_connectionsStore iterRecentLocationsForConsumer:a3 criteria:a4 limit:a5 client:a6 error:a7 block:a8];
}

- (id)locationQuery:(unint64_t)a3 fromDate:(id)a4 consumerType:(unint64_t)a5
{
  return (id)[MEMORY[0x1E4F89E58] queryForMapsWithLimit:a3 fromDate:a4 consumerType:a5];
}

- (id)namedEntityQuery:(unint64_t)a3 fromDate:(id)a4 consumerType:(unint64_t)a5
{
  return (id)[MEMORY[0x1E4F89EA0] locationQueryWithLimit:a3 fromDate:a4 consumerType:a5];
}

- (BOOL)iterRankedLocationsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  return [(PPLocationStore *)self->_locationStore iterRankedLocationsWithQuery:a3 error:a4 block:a5];
}

- (void)namedEntityStore_registerFeedback:(id)a3 clientIdentifier:(id)a4 completion:(id)a5
{
}

- (void)locationStore_registerFeedback:(id)a3 clientIdentifier:(id)a4 completion:(id)a5
{
}

- (void)connectionsStore_registerFeedback:(id)a3 clientIdentifier:(id)a4 completion:(id)a5
{
}

- (id)rankedNamedEntitiesWihQuery:(id)a3 error:(id *)a4
{
  return (id)[(PPNamedEntityStore *)self->_namedEntityStore rankedNamedEntitiesWithQuery:a3 error:a4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
  objc_storeStrong((id *)&self->_connectionsStore, 0);
  objc_storeStrong((id *)&self->_locationStore, 0);
}

@end