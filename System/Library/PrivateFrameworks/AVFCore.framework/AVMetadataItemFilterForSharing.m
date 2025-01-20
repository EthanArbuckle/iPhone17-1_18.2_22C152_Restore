@interface AVMetadataItemFilterForSharing
+ (void)addIdentifier:(id)a3 toWhitelistDictionary:(id)a4;
+ (void)addKeySpace:(id)a3 key:(id)a4 toWhitelistDictionary:(id)a5;
- (id)whitelist;
@end

@implementation AVMetadataItemFilterForSharing

+ (void)addKeySpace:(id)a3 key:(id)a4 toWhitelistDictionary:(id)a5
{
  v8 = objc_msgSend(a5, "objectForKey:");
  if (!v8)
  {
    v8 = (void *)[MEMORY[0x1E4F1CA48] array];
    [a5 setObject:v8 forKey:a3];
  }
  [v8 addObject:a4];
}

+ (void)addIdentifier:(id)a3 toWhitelistDictionary:(id)a4
{
  v6 = +[AVMetadataItem keySpaceForIdentifier:](AVMetadataItem, "keySpaceForIdentifier:");
  id v7 = +[AVMetadataItem keyForIdentifier:a3];
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    +[AVMetadataItemFilterForSharing addKeySpace:v6 key:v7 toWhitelistDictionary:a4];
  }
}

- (id)whitelist
{
  if (whitelist_onceToken != -1) {
    dispatch_once(&whitelist_onceToken, &__block_literal_global_390);
  }
  return (id)whitelist_sWhitelist;
}

uint64_t __43__AVMetadataItemFilterForSharing_whitelist__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  +[AVMetadataItemFilterForSharing addKeySpace:@"comn" key:@"copyrights" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"mdta" key:@"com.apple.quicktime.copyright" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"udta" key:@"@cpy" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"uiso" key:@"cprt" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"org.id3" key:@"TCOP" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"org.id3" key:@"WCOP" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"itsk" key:@"cprt" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"mdta" key:@"com.apple.quicktime.phonogramrights" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"udta" key:@"@phg" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"itsk" key:@"@phg" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"itsk" key:@"akID" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"itsk" key:@"apID" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"comn" key:@"make" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"mdta" key:@"com.apple.quicktime.make" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"udta" key:@"@mak" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"comn" key:@"model" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"mdta" key:@"com.apple.quicktime.model" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"udta" key:@"@mod" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"comn" key:@"software" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"mdta" key:@"com.apple.quicktime.software" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"udta" key:@"@swr" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"itsk" key:@"@too" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"comn" key:@"creationDate" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"mdta" key:@"com.apple.quicktime.creationdate" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"udta" key:@"@day" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"org.id3" key:@"TDAT" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"comn" key:@"language" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"comn" key:@"identifier" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"udta" key:@"@req" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"udta" key:@"tagc" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"uiso" key:@"tagc" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"org.id3" key:@"AENC" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"org.id3" key:@"ENCR" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"org.id3" key:@"UFID" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"mdta" key:@"com.apple.quicktime.content.identifier" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"mdta" key:@"com.apple.quicktime.live-photo.video-stabilization-crop-percentage-numerator" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"mdta" key:@"com.apple.quicktime.live-photo.video-stabilization-crop-percentage-denominator" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"mdta" key:@"com.apple.quicktime.is-montage" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"mdta" key:@"com.apple.quicktime.live-photo.vitality-disabled" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"itlk" key:@"com.apple.iTunes.iTunSMPB" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"itlk" key:@"com.apple.iTunes.iTunNORM" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"uiso" key:@"ludt" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"com.apple.quicktime.udta" key:@"ludt" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"uiso" key:@"thmb" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"itsk" key:@"tmpo" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"org.id3" key:@"TBPM" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"org.id3" key:@"TLEN" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"org.id3" key:@"TMED" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addKeySpace:@"org.id3" key:@"TSIZ" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addIdentifier:@"mdta/com.apple.quicktime.detected-face" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addIdentifier:*MEMORY[0x1E4F217F8] toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addIdentifier:*MEMORY[0x1E4F217F0] toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addIdentifier:*MEMORY[0x1E4F21800] toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addIdentifier:*MEMORY[0x1E4F21808] toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addIdentifier:*MEMORY[0x1E4F218A0] toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addIdentifier:@"mdta/com.apple.quicktime.preferred-affine-transform" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addIdentifier:@"mdta/com.apple.quicktime.video-orientation" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addIdentifier:@"mdta/com.apple.quicktime.live-photo.auto" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addIdentifier:@"mdta/com.apple.quicktime.live-photo.vitality-score" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addIdentifier:@"mdta/com.apple.quicktime.live-photo.vitality-scoring-version" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addIdentifier:@"mdta/com.apple.quicktime.spatial-overcapture.quality-score" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addIdentifier:@"mdta/com.apple.quicktime.spatial-overcapture.quality-scoring-version" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addIdentifier:@"mdta/com.apple.quicktime.camera.lens_model" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addIdentifier:@"mdta/com.apple.quicktime.camera.focal_length.35mm_equivalent" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addIdentifier:@"mdta/com.apple.quicktime.full-frame-rate-playback-intent" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addIdentifier:@"mdta/com.apple.quicktime.spatial.format-version" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addIdentifier:@"mdta/com.apple.quicktime.spatial.low-motion" toWhitelistDictionary:v0];
  +[AVMetadataItemFilterForSharing addIdentifier:@"mdta/com.apple.quicktime.spatial.aggressors-seen" toWhitelistDictionary:v0];
  uint64_t result = +[AVMetadataItemFilterForSharing addIdentifier:@"mdta/com.apple.quicktime.aime-data" toWhitelistDictionary:v0];
  whitelist_sWhitelist = (uint64_t)v0;
  return result;
}

@end