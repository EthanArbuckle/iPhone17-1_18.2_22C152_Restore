@interface PodcastsArtworkCatalogDataSource
- (BOOL)areRepresentationsAvailableForCatalog:(id)a3;
- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4;
- (_TtC17MediaPlaybackCore32PodcastsArtworkCatalogDataSource)init;
- (id)existingRepresentationForArtworkCatalog:(id)a3;
- (id)visualIdenticalityIdentifierForCatalog:(id)a3;
- (void)loadRepresentationForArtworkCatalog:(MPArtworkCatalog *)a3 completionHandler:(id)a4;
@end

@implementation PodcastsArtworkCatalogDataSource

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_21BD06778(v4);

  return self & 1;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  return 1;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_21BD0689C(v4);

  return v6;
}

- (void)loadRepresentationForArtworkCatalog:(MPArtworkCatalog *)a3 completionHandler:(id)a4
{
  id v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;

  sub_21BD2EFC8((uint64_t)&unk_267C65078, (uint64_t)v7);
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_21BD07B6C(v4);

  return v6;
}

- (_TtC17MediaPlaybackCore32PodcastsArtworkCatalogDataSource)init
{
  return (_TtC17MediaPlaybackCore32PodcastsArtworkCatalogDataSource *)sub_21BD08108();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC17MediaPlaybackCore32PodcastsArtworkCatalogDataSource_artworkLoader;
  sub_21BEA99B8();
  OUTLINED_FUNCTION_24();
  (*(void (**)(char *))(v4 + 8))(v3);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17MediaPlaybackCore32PodcastsArtworkCatalogDataSource_storeArtworkDataSource));
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17MediaPlaybackCore32PodcastsArtworkCatalogDataSource_cache);
}

@end