@interface PodcastsArtworkDataSourceVisualIdenticalityToken
- (BOOL)isEqual:(id)a3;
- (_TtC17MediaPlaybackCore48PodcastsArtworkDataSourceVisualIdenticalityToken)init;
- (id)copyWithZone:(void *)a3;
- (id)stringRepresentation;
- (int64_t)hash;
@end

@implementation PodcastsArtworkDataSourceVisualIdenticalityToken

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_21BD08350(v6);

  __swift_project_boxed_opaque_existential_0Tm(v6, v6[3]);
  v4 = (void *)sub_21BEAAE58();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v6);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_21BEAAAB8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_21BD0845C((uint64_t)v8);

  sub_21BD089A0((uint64_t)v8, (void (*)(void))sub_21BC04C3C);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_21BD085E0();

  return v3;
}

- (id)stringRepresentation
{
  sub_21BD08638();
  if (v2)
  {
    int64_t v3 = (void *)sub_21BEAA138();
    swift_bridgeObjectRelease();
  }
  else
  {
    int64_t v3 = 0;
  }

  return v3;
}

- (_TtC17MediaPlaybackCore48PodcastsArtworkDataSourceVisualIdenticalityToken)init
{
}

- (void).cxx_destruct
{
}

@end