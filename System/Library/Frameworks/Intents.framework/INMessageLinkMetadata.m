@interface INMessageLinkMetadata
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INMessageLinkMetadata)init;
- (INMessageLinkMetadata)initWithCoder:(id)a3;
- (INMessageLinkMetadata)initWithSiteName:(NSString *)siteName summary:(NSString *)summary title:(NSString *)title openGraphType:(NSString *)openGraphType linkURL:(NSURL *)linkURL;
- (INMessageLinkMetadata)initWithSiteName:(id)a3 summary:(id)a4 title:(id)a5 itemType:(id)a6 originalURL:(id)a7 imageURLs:(id)a8 iconURLs:(id)a9 creator:(id)a10 linkMediaType:(int64_t)a11 iTunesStoreIdentifier:(id)a12 iTunesStoreFrontIdentifier:(id)a13 songTitle:(id)a14 songArtist:(id)a15 songAlbum:(id)a16 albumName:(id)a17 albumArtist:(id)a18 musicVideoName:(id)a19 musicVideoArtist:(id)a20 artistName:(id)a21 artistGenre:(id)a22 playlistName:(id)a23 playlistCurator:(id)a24 radioName:(id)a25 radioCurator:(id)a26 softwareName:(id)a27 softwareGenre:(id)a28 softwarePlatform:(id)a29 bookName:(id)a30 bookAuthor:(id)a31 audioBookName:(id)a32 audioBookAuthor:(id)a33 audioBookNarrator:(id)a34 podcastName:(id)a35 podcastArtist:(id)a36 podcastEpisodeName:(id)a37 podcastEpisodePodcastName:(id)a38 podcastEpisodeArtist:(id)a39 podcastEpisodeReleaseDate:(id)a40 tvEpisodeEpisodeName:(id)a41 tvEpisodeSeasonName:(id)a42 tvEpisodeGenre:(id)a43 tvSeasonName:(id)a44 tvSeasonGenre:(id)a45 movieName:(id)a46 movieGenre:(id)a47 tvShowName:(id)a48 movieBundleName:(id)a49 movieBundleGenre:(id)a50 appleTvTitle:(id)a51 appleTvSubtitle:(id)a52;
- (INMessageLinkMetadata)initWithSiteName:(id)a3 summary:(id)a4 title:(id)a5 openGraphType:(id)a6 itemType:(id)a7 linkURL:(id)a8 originalURL:(id)a9 imageURLs:(id)a10 iconURLs:(id)a11 creator:(id)a12 linkMediaType:(int64_t)a13 iTunesStoreIdentifier:(id)a14 iTunesStoreFrontIdentifier:(id)a15 songTitle:(id)a16 songArtist:(id)a17 songAlbum:(id)a18 albumName:(id)a19 albumArtist:(id)a20 musicVideoName:(id)a21 musicVideoArtist:(id)a22 artistName:(id)a23 artistGenre:(id)a24 playlistName:(id)a25 playlistCurator:(id)a26 radioName:(id)a27 radioCurator:(id)a28 softwareName:(id)a29 softwareGenre:(id)a30 softwarePlatform:(id)a31 bookName:(id)a32 bookAuthor:(id)a33 audioBookName:(id)a34 audioBookAuthor:(id)a35 audioBookNarrator:(id)a36 podcastName:(id)a37 podcastArtist:(id)a38 podcastEpisodeName:(id)a39 podcastEpisodePodcastName:(id)a40 podcastEpisodeArtist:(id)a41 podcastEpisodeReleaseDate:(id)a42 tvEpisodeEpisodeName:(id)a43 tvEpisodeSeasonName:(id)a44 tvEpisodeGenre:(id)a45 tvSeasonName:(id)a46 tvSeasonGenre:(id)a47 movieName:(id)a48 movieGenre:(id)a49 tvShowName:(id)a50 movieBundleName:(id)a51 movieBundleGenre:(id)a52 appleTvTitle:(id)a53 appleTvSubtitle:(id)a54;
- (NSArray)iconURLs;
- (NSArray)imageURLs;
- (NSDateComponents)podcastEpisodeReleaseDate;
- (NSString)albumArtist;
- (NSString)albumName;
- (NSString)appleTvSubtitle;
- (NSString)appleTvTitle;
- (NSString)artistGenre;
- (NSString)artistName;
- (NSString)audioBookAuthor;
- (NSString)audioBookName;
- (NSString)audioBookNarrator;
- (NSString)bookAuthor;
- (NSString)bookName;
- (NSString)creator;
- (NSString)description;
- (NSString)iTunesStoreFrontIdentifier;
- (NSString)iTunesStoreIdentifier;
- (NSString)itemType;
- (NSString)movieBundleGenre;
- (NSString)movieBundleName;
- (NSString)movieGenre;
- (NSString)movieName;
- (NSString)musicVideoArtist;
- (NSString)musicVideoName;
- (NSString)openGraphType;
- (NSString)originalURL;
- (NSString)playlistCurator;
- (NSString)playlistName;
- (NSString)podcastArtist;
- (NSString)podcastEpisodeArtist;
- (NSString)podcastEpisodeName;
- (NSString)podcastEpisodePodcastName;
- (NSString)podcastName;
- (NSString)radioCurator;
- (NSString)radioName;
- (NSString)siteName;
- (NSString)softwareGenre;
- (NSString)softwareName;
- (NSString)softwarePlatform;
- (NSString)songAlbum;
- (NSString)songArtist;
- (NSString)songTitle;
- (NSString)summary;
- (NSString)title;
- (NSString)tvEpisodeEpisodeName;
- (NSString)tvEpisodeGenre;
- (NSString)tvEpisodeSeasonName;
- (NSString)tvSeasonGenre;
- (NSString)tvSeasonName;
- (NSString)tvShowName;
- (NSURL)linkURL;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)linkMediaType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAlbumArtist:(id)a3;
- (void)setAlbumName:(id)a3;
- (void)setAppleTvSubtitle:(id)a3;
- (void)setAppleTvTitle:(id)a3;
- (void)setArtistGenre:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setAudioBookAuthor:(id)a3;
- (void)setAudioBookName:(id)a3;
- (void)setAudioBookNarrator:(id)a3;
- (void)setBookAuthor:(id)a3;
- (void)setBookName:(id)a3;
- (void)setCreator:(id)a3;
- (void)setITunesStoreFrontIdentifier:(id)a3;
- (void)setITunesStoreIdentifier:(id)a3;
- (void)setIconURLs:(id)a3;
- (void)setImageURLs:(id)a3;
- (void)setItemType:(id)a3;
- (void)setLinkMediaType:(int64_t)a3;
- (void)setLinkURL:(NSURL *)linkURL;
- (void)setMovieBundleGenre:(id)a3;
- (void)setMovieBundleName:(id)a3;
- (void)setMovieGenre:(id)a3;
- (void)setMovieName:(id)a3;
- (void)setMusicVideoArtist:(id)a3;
- (void)setMusicVideoName:(id)a3;
- (void)setOpenGraphType:(NSString *)openGraphType;
- (void)setOriginalURL:(id)a3;
- (void)setPlaylistCurator:(id)a3;
- (void)setPlaylistName:(id)a3;
- (void)setPodcastArtist:(id)a3;
- (void)setPodcastEpisodeArtist:(id)a3;
- (void)setPodcastEpisodeName:(id)a3;
- (void)setPodcastEpisodePodcastName:(id)a3;
- (void)setPodcastEpisodeReleaseDate:(id)a3;
- (void)setPodcastName:(id)a3;
- (void)setRadioCurator:(id)a3;
- (void)setRadioName:(id)a3;
- (void)setSiteName:(NSString *)siteName;
- (void)setSoftwareGenre:(id)a3;
- (void)setSoftwareName:(id)a3;
- (void)setSoftwarePlatform:(id)a3;
- (void)setSongAlbum:(id)a3;
- (void)setSongArtist:(id)a3;
- (void)setSongTitle:(id)a3;
- (void)setSummary:(NSString *)summary;
- (void)setTitle:(NSString *)title;
- (void)setTvEpisodeEpisodeName:(id)a3;
- (void)setTvEpisodeGenre:(id)a3;
- (void)setTvEpisodeSeasonName:(id)a3;
- (void)setTvSeasonGenre:(id)a3;
- (void)setTvSeasonName:(id)a3;
- (void)setTvShowName:(id)a3;
@end

@implementation INMessageLinkMetadata

- (id)_dictionaryRepresentation
{
  v159[52] = *MEMORY[0x1E4F143B8];
  v158[0] = @"siteName";
  uint64_t siteName = (uint64_t)self->_siteName;
  uint64_t v156 = siteName;
  if (!siteName)
  {
    uint64_t siteName = [MEMORY[0x1E4F1CA98] null];
  }
  v100 = (void *)siteName;
  v159[0] = siteName;
  v158[1] = @"summary";
  uint64_t summary = (uint64_t)self->_summary;
  uint64_t v155 = summary;
  if (!summary)
  {
    uint64_t summary = [MEMORY[0x1E4F1CA98] null];
  }
  v99 = (void *)summary;
  v159[1] = summary;
  v158[2] = @"title";
  uint64_t title = (uint64_t)self->_title;
  uint64_t v154 = title;
  if (!title)
  {
    uint64_t title = [MEMORY[0x1E4F1CA98] null];
  }
  v98 = (void *)title;
  v159[2] = title;
  v158[3] = @"openGraphType";
  uint64_t openGraphType = (uint64_t)self->_openGraphType;
  uint64_t v153 = openGraphType;
  if (!openGraphType)
  {
    uint64_t openGraphType = [MEMORY[0x1E4F1CA98] null];
  }
  v97 = (void *)openGraphType;
  v159[3] = openGraphType;
  v158[4] = @"itemType";
  uint64_t itemType = (uint64_t)self->_itemType;
  uint64_t v152 = itemType;
  if (!itemType)
  {
    uint64_t itemType = [MEMORY[0x1E4F1CA98] null];
  }
  v96 = (void *)itemType;
  v159[4] = itemType;
  v158[5] = @"linkURL";
  uint64_t linkURL = (uint64_t)self->_linkURL;
  uint64_t v151 = linkURL;
  if (!linkURL)
  {
    uint64_t linkURL = [MEMORY[0x1E4F1CA98] null];
  }
  v95 = (void *)linkURL;
  v159[5] = linkURL;
  v158[6] = @"originalURL";
  uint64_t originalURL = (uint64_t)self->_originalURL;
  uint64_t v150 = originalURL;
  if (!originalURL)
  {
    uint64_t originalURL = [MEMORY[0x1E4F1CA98] null];
  }
  v94 = (void *)originalURL;
  v159[6] = originalURL;
  v158[7] = @"imageURLs";
  uint64_t imageURLs = (uint64_t)self->_imageURLs;
  uint64_t v149 = imageURLs;
  if (!imageURLs)
  {
    uint64_t imageURLs = [MEMORY[0x1E4F1CA98] null];
  }
  v93 = (void *)imageURLs;
  v159[7] = imageURLs;
  v158[8] = @"iconURLs";
  uint64_t iconURLs = (uint64_t)self->_iconURLs;
  uint64_t v148 = iconURLs;
  if (!iconURLs)
  {
    uint64_t iconURLs = [MEMORY[0x1E4F1CA98] null];
  }
  v92 = (void *)iconURLs;
  v159[8] = iconURLs;
  v158[9] = @"creator";
  uint64_t creator = (uint64_t)self->_creator;
  uint64_t v147 = creator;
  if (!creator)
  {
    uint64_t creator = [MEMORY[0x1E4F1CA98] null];
  }
  v91 = (void *)creator;
  v159[9] = creator;
  v158[10] = @"linkMediaType";
  v146 = [NSNumber numberWithInteger:self->_linkMediaType];
  v159[10] = v146;
  v158[11] = @"iTunesStoreIdentifier";
  uint64_t iTunesStoreIdentifier = (uint64_t)self->_iTunesStoreIdentifier;
  uint64_t v145 = iTunesStoreIdentifier;
  if (!iTunesStoreIdentifier)
  {
    uint64_t iTunesStoreIdentifier = [MEMORY[0x1E4F1CA98] null];
  }
  v159[11] = iTunesStoreIdentifier;
  v158[12] = @"iTunesStoreFrontIdentifier";
  uint64_t iTunesStoreFrontIdentifier = (uint64_t)self->_iTunesStoreFrontIdentifier;
  uint64_t v143 = iTunesStoreFrontIdentifier;
  if (!iTunesStoreFrontIdentifier)
  {
    uint64_t iTunesStoreFrontIdentifier = [MEMORY[0x1E4F1CA98] null];
  }
  v159[12] = iTunesStoreFrontIdentifier;
  v158[13] = @"songTitle";
  uint64_t songTitle = (uint64_t)self->_songTitle;
  uint64_t v141 = songTitle;
  if (!songTitle)
  {
    uint64_t songTitle = [MEMORY[0x1E4F1CA98] null];
  }
  v159[13] = songTitle;
  v158[14] = @"songArtist";
  uint64_t songArtist = (uint64_t)self->_songArtist;
  uint64_t v139 = songArtist;
  if (!songArtist)
  {
    uint64_t songArtist = [MEMORY[0x1E4F1CA98] null];
  }
  v159[14] = songArtist;
  v158[15] = @"songAlbum";
  uint64_t songAlbum = (uint64_t)self->_songAlbum;
  uint64_t v137 = songAlbum;
  if (!songAlbum)
  {
    uint64_t songAlbum = [MEMORY[0x1E4F1CA98] null];
  }
  v159[15] = songAlbum;
  v158[16] = @"albumName";
  uint64_t albumName = (uint64_t)self->_albumName;
  uint64_t v135 = albumName;
  if (!albumName)
  {
    uint64_t albumName = [MEMORY[0x1E4F1CA98] null];
  }
  v159[16] = albumName;
  v158[17] = @"albumArtist";
  uint64_t albumArtist = (uint64_t)self->_albumArtist;
  uint64_t v133 = albumArtist;
  if (!albumArtist)
  {
    uint64_t albumArtist = [MEMORY[0x1E4F1CA98] null];
  }
  v159[17] = albumArtist;
  v158[18] = @"musicVideoName";
  uint64_t musicVideoName = (uint64_t)self->_musicVideoName;
  uint64_t v131 = musicVideoName;
  if (!musicVideoName)
  {
    uint64_t musicVideoName = [MEMORY[0x1E4F1CA98] null];
  }
  v159[18] = musicVideoName;
  v158[19] = @"musicVideoArtist";
  uint64_t musicVideoArtist = (uint64_t)self->_musicVideoArtist;
  uint64_t v129 = musicVideoArtist;
  if (!musicVideoArtist)
  {
    uint64_t musicVideoArtist = [MEMORY[0x1E4F1CA98] null];
  }
  v159[19] = musicVideoArtist;
  v158[20] = @"artistName";
  uint64_t artistName = (uint64_t)self->_artistName;
  uint64_t v128 = artistName;
  if (!artistName)
  {
    uint64_t artistName = [MEMORY[0x1E4F1CA98] null];
  }
  v127 = (void *)artistName;
  v159[20] = artistName;
  v158[21] = @"artistGenre";
  uint64_t artistGenre = (uint64_t)self->_artistGenre;
  uint64_t v126 = artistGenre;
  if (!artistGenre)
  {
    uint64_t artistGenre = [MEMORY[0x1E4F1CA98] null];
  }
  v157 = (void *)artistGenre;
  v159[21] = artistGenre;
  v158[22] = @"playlistName";
  uint64_t playlistName = (uint64_t)self->_playlistName;
  uint64_t v125 = playlistName;
  if (!playlistName)
  {
    uint64_t playlistName = [MEMORY[0x1E4F1CA98] null];
  }
  v90 = (void *)playlistName;
  v159[22] = playlistName;
  v158[23] = @"playlistCurator";
  uint64_t playlistCurator = (uint64_t)self->_playlistCurator;
  uint64_t v124 = playlistCurator;
  if (!playlistCurator)
  {
    uint64_t playlistCurator = [MEMORY[0x1E4F1CA98] null];
  }
  v89 = (void *)playlistCurator;
  v159[23] = playlistCurator;
  v158[24] = @"radioName";
  uint64_t radioName = (uint64_t)self->_radioName;
  uint64_t v123 = radioName;
  if (!radioName)
  {
    uint64_t radioName = [MEMORY[0x1E4F1CA98] null];
  }
  v88 = (void *)radioName;
  v159[24] = radioName;
  v158[25] = @"radioCurator";
  uint64_t radioCurator = (uint64_t)self->_radioCurator;
  uint64_t v122 = radioCurator;
  if (!radioCurator)
  {
    uint64_t radioCurator = [MEMORY[0x1E4F1CA98] null];
  }
  v87 = (void *)radioCurator;
  v159[25] = radioCurator;
  v158[26] = @"softwareName";
  uint64_t softwareName = (uint64_t)self->_softwareName;
  uint64_t v121 = softwareName;
  if (!softwareName)
  {
    uint64_t softwareName = [MEMORY[0x1E4F1CA98] null];
  }
  v86 = (void *)softwareName;
  v159[26] = softwareName;
  v158[27] = @"softwareGenre";
  uint64_t softwareGenre = (uint64_t)self->_softwareGenre;
  uint64_t v120 = softwareGenre;
  if (!softwareGenre)
  {
    uint64_t softwareGenre = [MEMORY[0x1E4F1CA98] null];
  }
  v85 = (void *)softwareGenre;
  v159[27] = softwareGenre;
  v158[28] = @"softwarePlatform";
  uint64_t softwarePlatform = (uint64_t)self->_softwarePlatform;
  uint64_t v119 = softwarePlatform;
  if (!softwarePlatform)
  {
    uint64_t softwarePlatform = [MEMORY[0x1E4F1CA98] null];
  }
  v84 = (void *)softwarePlatform;
  v159[28] = softwarePlatform;
  v158[29] = @"bookName";
  uint64_t bookName = (uint64_t)self->_bookName;
  uint64_t v118 = bookName;
  if (!bookName)
  {
    uint64_t bookName = [MEMORY[0x1E4F1CA98] null];
  }
  v83 = (void *)bookName;
  v159[29] = bookName;
  v158[30] = @"bookAuthor";
  uint64_t bookAuthor = (uint64_t)self->_bookAuthor;
  uint64_t v117 = bookAuthor;
  if (!bookAuthor)
  {
    uint64_t bookAuthor = [MEMORY[0x1E4F1CA98] null];
  }
  v82 = (void *)bookAuthor;
  v159[30] = bookAuthor;
  v158[31] = @"audioBookName";
  uint64_t audioBookName = (uint64_t)self->_audioBookName;
  uint64_t v116 = audioBookName;
  if (!audioBookName)
  {
    uint64_t audioBookName = [MEMORY[0x1E4F1CA98] null];
  }
  v81 = (void *)audioBookName;
  v159[31] = audioBookName;
  v158[32] = @"audioBookAuthor";
  uint64_t audioBookAuthor = (uint64_t)self->_audioBookAuthor;
  uint64_t v115 = audioBookAuthor;
  if (!audioBookAuthor)
  {
    uint64_t audioBookAuthor = [MEMORY[0x1E4F1CA98] null];
  }
  v80 = (void *)audioBookAuthor;
  v159[32] = audioBookAuthor;
  v158[33] = @"audioBookNarrator";
  uint64_t audioBookNarrator = (uint64_t)self->_audioBookNarrator;
  uint64_t v114 = audioBookNarrator;
  if (!audioBookNarrator)
  {
    uint64_t audioBookNarrator = [MEMORY[0x1E4F1CA98] null];
  }
  v79 = (void *)audioBookNarrator;
  v159[33] = audioBookNarrator;
  v158[34] = @"podcastName";
  uint64_t podcastName = (uint64_t)self->_podcastName;
  uint64_t v113 = podcastName;
  if (!podcastName)
  {
    uint64_t podcastName = [MEMORY[0x1E4F1CA98] null];
  }
  v78 = (void *)podcastName;
  v159[34] = podcastName;
  v158[35] = @"podcastArtist";
  uint64_t podcastArtist = (uint64_t)self->_podcastArtist;
  uint64_t v112 = podcastArtist;
  if (!podcastArtist)
  {
    uint64_t podcastArtist = [MEMORY[0x1E4F1CA98] null];
  }
  v77 = (void *)podcastArtist;
  v159[35] = podcastArtist;
  v158[36] = @"podcastEpisodeName";
  uint64_t podcastEpisodeName = (uint64_t)self->_podcastEpisodeName;
  uint64_t v111 = podcastEpisodeName;
  if (!podcastEpisodeName)
  {
    uint64_t podcastEpisodeName = [MEMORY[0x1E4F1CA98] null];
  }
  v76 = (void *)podcastEpisodeName;
  v159[36] = podcastEpisodeName;
  v158[37] = @"podcastEpisodePodcastName";
  uint64_t podcastEpisodePodcastName = (uint64_t)self->_podcastEpisodePodcastName;
  uint64_t v110 = podcastEpisodePodcastName;
  if (!podcastEpisodePodcastName)
  {
    uint64_t podcastEpisodePodcastName = [MEMORY[0x1E4F1CA98] null];
  }
  v75 = (void *)podcastEpisodePodcastName;
  v159[37] = podcastEpisodePodcastName;
  v158[38] = @"podcastEpisodeArtist";
  uint64_t podcastEpisodeArtist = (uint64_t)self->_podcastEpisodeArtist;
  uint64_t v109 = podcastEpisodeArtist;
  if (!podcastEpisodeArtist)
  {
    uint64_t podcastEpisodeArtist = [MEMORY[0x1E4F1CA98] null];
  }
  v74 = (void *)podcastEpisodeArtist;
  v159[38] = podcastEpisodeArtist;
  v158[39] = @"podcastEpisodeReleaseDate";
  uint64_t podcastEpisodeReleaseDate = (uint64_t)self->_podcastEpisodeReleaseDate;
  uint64_t v108 = podcastEpisodeReleaseDate;
  if (!podcastEpisodeReleaseDate)
  {
    uint64_t podcastEpisodeReleaseDate = [MEMORY[0x1E4F1CA98] null];
  }
  v73 = (void *)podcastEpisodeReleaseDate;
  v159[39] = podcastEpisodeReleaseDate;
  v158[40] = @"tvEpisodeEpisodeName";
  uint64_t tvEpisodeEpisodeName = (uint64_t)self->_tvEpisodeEpisodeName;
  uint64_t v107 = tvEpisodeEpisodeName;
  if (!tvEpisodeEpisodeName)
  {
    uint64_t tvEpisodeEpisodeName = [MEMORY[0x1E4F1CA98] null];
  }
  v72 = (void *)tvEpisodeEpisodeName;
  v159[40] = tvEpisodeEpisodeName;
  v158[41] = @"tvEpisodeSeasonName";
  uint64_t tvEpisodeSeasonName = (uint64_t)self->_tvEpisodeSeasonName;
  uint64_t v106 = tvEpisodeSeasonName;
  if (!tvEpisodeSeasonName)
  {
    uint64_t tvEpisodeSeasonName = [MEMORY[0x1E4F1CA98] null];
  }
  v71 = (void *)tvEpisodeSeasonName;
  v159[41] = tvEpisodeSeasonName;
  v158[42] = @"tvEpisodeGenre";
  uint64_t tvEpisodeGenre = (uint64_t)self->_tvEpisodeGenre;
  uint64_t v105 = tvEpisodeGenre;
  if (!tvEpisodeGenre)
  {
    uint64_t tvEpisodeGenre = [MEMORY[0x1E4F1CA98] null];
  }
  v70 = (void *)tvEpisodeGenre;
  v159[42] = tvEpisodeGenre;
  v158[43] = @"tvSeasonName";
  uint64_t tvSeasonName = (uint64_t)self->_tvSeasonName;
  uint64_t v104 = tvSeasonName;
  if (!tvSeasonName)
  {
    uint64_t tvSeasonName = [MEMORY[0x1E4F1CA98] null];
  }
  v69 = (void *)tvSeasonName;
  v159[43] = tvSeasonName;
  v158[44] = @"tvSeasonGenre";
  uint64_t tvSeasonGenre = (uint64_t)self->_tvSeasonGenre;
  uint64_t v103 = tvSeasonGenre;
  if (!tvSeasonGenre)
  {
    uint64_t tvSeasonGenre = [MEMORY[0x1E4F1CA98] null];
  }
  v142 = (void *)iTunesStoreFrontIdentifier;
  v68 = (void *)tvSeasonGenre;
  v159[44] = tvSeasonGenre;
  v158[45] = @"movieName";
  uint64_t movieName = (uint64_t)self->_movieName;
  uint64_t v102 = movieName;
  if (!movieName)
  {
    uint64_t movieName = [MEMORY[0x1E4F1CA98] null];
  }
  v140 = (void *)songTitle;
  v67 = (void *)movieName;
  v159[45] = movieName;
  v158[46] = @"movieGenre";
  movieGenre = self->_movieGenre;
  uint64_t v49 = (uint64_t)movieGenre;
  if (!movieGenre)
  {
    uint64_t v49 = [MEMORY[0x1E4F1CA98] null];
  }
  v132 = (void *)albumArtist;
  v138 = (void *)songArtist;
  v66 = (void *)v49;
  v159[46] = v49;
  v158[47] = @"tvShowName";
  tvShowName = self->_tvShowName;
  uint64_t v51 = (uint64_t)tvShowName;
  if (!tvShowName)
  {
    uint64_t v51 = [MEMORY[0x1E4F1CA98] null];
  }
  v134 = (void *)albumName;
  v144 = (void *)iTunesStoreIdentifier;
  v65 = (void *)v51;
  v159[47] = v51;
  v158[48] = @"movieBundleName";
  movieBundleName = self->_movieBundleName;
  uint64_t v53 = (uint64_t)movieBundleName;
  if (!movieBundleName)
  {
    uint64_t v53 = [MEMORY[0x1E4F1CA98] null];
  }
  v130 = (void *)musicVideoName;
  v136 = (void *)songAlbum;
  uint64_t v63 = v53;
  v159[48] = v53;
  v158[49] = @"movieBundleGenre";
  movieBundleGenre = self->_movieBundleGenre;
  v55 = movieBundleGenre;
  if (!movieBundleGenre)
  {
    objc_msgSend(MEMORY[0x1E4F1CA98], "null", v53, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80,
      v81,
      v82,
      v83,
      v84,
      v85,
      v86,
      v87,
      v88,
      v89,
    v55 = v90);
  }
  v56 = (void *)musicVideoArtist;
  v159[49] = v55;
  v158[50] = @"appleTvTitle";
  appleTvTitle = self->_appleTvTitle;
  v58 = appleTvTitle;
  if (!appleTvTitle)
  {
    v58 = [MEMORY[0x1E4F1CA98] null];
  }
  v159[50] = v58;
  v158[51] = @"appleTvSubtitle";
  appleTvSubuint64_t title = self->_appleTvSubtitle;
  v60 = appleTvSubtitle;
  if (!appleTvSubtitle)
  {
    v60 = [MEMORY[0x1E4F1CA98] null];
  }
  v159[51] = v60;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v159, v158, 52, v63);
  id v101 = (id)objc_claimAutoreleasedReturnValue();
  if (!appleTvSubtitle) {

  }
  v61 = v157;
  if (!appleTvTitle)
  {

    v61 = v157;
  }
  if (!movieBundleGenre)
  {

    v61 = v157;
  }
  if (!movieBundleName)
  {

    v61 = v157;
  }
  if (!tvShowName)
  {

    v61 = v157;
  }
  if (!movieGenre)
  {

    v61 = v157;
  }
  if (!v102)
  {

    v61 = v157;
  }
  if (!v103)
  {

    v61 = v157;
  }
  if (!v104)
  {

    v61 = v157;
  }
  if (!v105)
  {

    v61 = v157;
  }
  if (!v106)
  {

    v61 = v157;
  }
  if (!v107)
  {

    v61 = v157;
  }
  if (!v108)
  {

    v61 = v157;
  }
  if (!v109)
  {

    v61 = v157;
  }
  if (!v110)
  {

    v61 = v157;
  }
  if (!v111)
  {

    v61 = v157;
  }
  if (!v112)
  {

    v61 = v157;
  }
  if (!v113)
  {

    v61 = v157;
  }
  if (!v114)
  {

    v61 = v157;
  }
  if (!v115)
  {

    v61 = v157;
  }
  if (!v116)
  {

    v61 = v157;
  }
  if (!v117)
  {

    v61 = v157;
  }
  if (!v118)
  {

    v61 = v157;
  }
  if (!v119)
  {

    v61 = v157;
  }
  if (!v120)
  {

    v61 = v157;
  }
  if (!v121)
  {

    v61 = v157;
  }
  if (!v122)
  {

    v61 = v157;
  }
  if (!v123)
  {

    v61 = v157;
  }
  if (!v124)
  {

    v61 = v157;
  }
  if (!v125)
  {

    v61 = v157;
  }
  if (!v126) {

  }
  if (!v128) {
  if (!v129)
  }

  if (!v131) {
  if (!v133)
  }

  if (!v135) {
  if (!v137)
  }

  if (!v139) {
  if (!v141)
  }

  if (!v143) {
  if (!v145)
  }

  if (!v147) {
  if (!v148)
  }

  if (!v149) {
  if (!v150)
  }

  if (!v151) {
  if (!v152)
  }

  if (!v153) {
  if (!v154)
  }

  if (!v155) {
  if (!v156)
  }

  return v101;
}

- (INMessageLinkMetadata)initWithSiteName:(id)a3 summary:(id)a4 title:(id)a5 itemType:(id)a6 originalURL:(id)a7 imageURLs:(id)a8 iconURLs:(id)a9 creator:(id)a10 linkMediaType:(int64_t)a11 iTunesStoreIdentifier:(id)a12 iTunesStoreFrontIdentifier:(id)a13 songTitle:(id)a14 songArtist:(id)a15 songAlbum:(id)a16 albumName:(id)a17 albumArtist:(id)a18 musicVideoName:(id)a19 musicVideoArtist:(id)a20 artistName:(id)a21 artistGenre:(id)a22 playlistName:(id)a23 playlistCurator:(id)a24 radioName:(id)a25 radioCurator:(id)a26 softwareName:(id)a27 softwareGenre:(id)a28 softwarePlatform:(id)a29 bookName:(id)a30 bookAuthor:(id)a31 audioBookName:(id)a32 audioBookAuthor:(id)a33 audioBookNarrator:(id)a34 podcastName:(id)a35 podcastArtist:(id)a36 podcastEpisodeName:(id)a37 podcastEpisodePodcastName:(id)a38 podcastEpisodeArtist:(id)a39 podcastEpisodeReleaseDate:(id)a40 tvEpisodeEpisodeName:(id)a41 tvEpisodeSeasonName:(id)a42 tvEpisodeGenre:(id)a43 tvSeasonName:(id)a44 tvSeasonGenre:(id)a45 movieName:(id)a46 movieGenre:(id)a47 tvShowName:(id)a48 movieBundleName:(id)a49 movieBundleGenre:(id)a50 appleTvTitle:(id)a51 appleTvSubtitle:(id)a52
{
  return -[INMessageLinkMetadata initWithSiteName:summary:title:openGraphType:itemType:linkURL:originalURL:imageURLs:iconURLs:creator:linkMediaType:iTunesStoreIdentifier:iTunesStoreFrontIdentifier:songTitle:songArtist:songAlbum:albumName:albumArtist:musicVideoName:musicVideoArtist:artistName:artistGenre:playlistName:playlistCurator:radioName:radioCurator:softwareName:softwareGenre:softwarePlatform:bookName:bookAuthor:audioBookName:audioBookAuthor:audioBookNarrator:podcastName:podcastArtist:podcastEpisodeName:podcastEpisodePodcastName:podcastEpisodeArtist:podcastEpisodeReleaseDate:tvEpisodeEpisodeName:tvEpisodeSeasonName:tvEpisodeGenre:tvSeasonName:tvSeasonGenre:movieName:movieGenre:tvShowName:movieBundleName:movieBundleGenre:appleTvTitle:appleTvSubtitle:](self, "initWithSiteName:summary:title:openGraphType:itemType:linkURL:originalURL:imageURLs:iconURLs:creator:linkMediaType:iTunesStoreIdentifier:iTunesStoreFrontIdentifier:songTitle:songArtist:songAlbum:albumName:albumArtist:musicVideoName:musicVideoArtist:artistName:artistGenre:playlistName:playlistCurator:radioName:radioCurator:softwareName:softwareGenre:softwarePlatform:bookName:bookAuthor:audioBookName:audioBookAuthor:audioBookNarrator:podcastName:podcastArtist:podcastEpisodeName:podcastEpisodePodcastName:podcastEpisodeArtist:podcastEpisodeReleaseDate:tvEpisodeEpisodeName:tvEpisodeSeasonName:tvEpisodeGenre:tvSeasonName:tvSeasonGenre:movieName:movieGenre:tvShowName:movieBundleName:movieBundleGenre:appleTvTitle:appleTvSubtitle:", a3, a4, a5, 0, a6, 0, a7, a8, a9, a10, a11,
           a12,
           a13,
           a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleTvSubtitle, 0);
  objc_storeStrong((id *)&self->_appleTvTitle, 0);
  objc_storeStrong((id *)&self->_movieBundleGenre, 0);
  objc_storeStrong((id *)&self->_movieBundleName, 0);
  objc_storeStrong((id *)&self->_tvShowName, 0);
  objc_storeStrong((id *)&self->_movieGenre, 0);
  objc_storeStrong((id *)&self->_movieName, 0);
  objc_storeStrong((id *)&self->_tvSeasonGenre, 0);
  objc_storeStrong((id *)&self->_tvSeasonName, 0);
  objc_storeStrong((id *)&self->_tvEpisodeGenre, 0);
  objc_storeStrong((id *)&self->_tvEpisodeSeasonName, 0);
  objc_storeStrong((id *)&self->_tvEpisodeEpisodeName, 0);
  objc_storeStrong((id *)&self->_podcastEpisodeReleaseDate, 0);
  objc_storeStrong((id *)&self->_podcastEpisodeArtist, 0);
  objc_storeStrong((id *)&self->_podcastEpisodePodcastName, 0);
  objc_storeStrong((id *)&self->_podcastEpisodeName, 0);
  objc_storeStrong((id *)&self->_podcastArtist, 0);
  objc_storeStrong((id *)&self->_podcastName, 0);
  objc_storeStrong((id *)&self->_audioBookNarrator, 0);
  objc_storeStrong((id *)&self->_audioBookAuthor, 0);
  objc_storeStrong((id *)&self->_audioBookName, 0);
  objc_storeStrong((id *)&self->_bookAuthor, 0);
  objc_storeStrong((id *)&self->_bookName, 0);
  objc_storeStrong((id *)&self->_softwarePlatform, 0);
  objc_storeStrong((id *)&self->_softwareGenre, 0);
  objc_storeStrong((id *)&self->_softwareName, 0);
  objc_storeStrong((id *)&self->_radioCurator, 0);
  objc_storeStrong((id *)&self->_radioName, 0);
  objc_storeStrong((id *)&self->_playlistCurator, 0);
  objc_storeStrong((id *)&self->_playlistName, 0);
  objc_storeStrong((id *)&self->_artistGenre, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_musicVideoArtist, 0);
  objc_storeStrong((id *)&self->_musicVideoName, 0);
  objc_storeStrong((id *)&self->_albumArtist, 0);
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_songAlbum, 0);
  objc_storeStrong((id *)&self->_songArtist, 0);
  objc_storeStrong((id *)&self->_songTitle, 0);
  objc_storeStrong((id *)&self->_iTunesStoreFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_creator, 0);
  objc_storeStrong((id *)&self->_iconURLs, 0);
  objc_storeStrong((id *)&self->_imageURLs, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
  objc_storeStrong((id *)&self->_itemType, 0);
  objc_storeStrong((id *)&self->_linkURL, 0);
  objc_storeStrong((id *)&self->_openGraphType, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_summary, 0);

  objc_storeStrong((id *)&self->_siteName, 0);
}

- (void)setAppleTvSubtitle:(id)a3
{
}

- (NSString)appleTvSubtitle
{
  return self->_appleTvSubtitle;
}

- (void)setAppleTvTitle:(id)a3
{
}

- (NSString)appleTvTitle
{
  return self->_appleTvTitle;
}

- (void)setMovieBundleGenre:(id)a3
{
}

- (NSString)movieBundleGenre
{
  return self->_movieBundleGenre;
}

- (void)setMovieBundleName:(id)a3
{
}

- (NSString)movieBundleName
{
  return self->_movieBundleName;
}

- (void)setTvShowName:(id)a3
{
}

- (NSString)tvShowName
{
  return self->_tvShowName;
}

- (void)setMovieGenre:(id)a3
{
}

- (NSString)movieGenre
{
  return self->_movieGenre;
}

- (void)setMovieName:(id)a3
{
}

- (NSString)movieName
{
  return self->_movieName;
}

- (void)setTvSeasonGenre:(id)a3
{
}

- (NSString)tvSeasonGenre
{
  return self->_tvSeasonGenre;
}

- (void)setTvSeasonName:(id)a3
{
}

- (NSString)tvSeasonName
{
  return self->_tvSeasonName;
}

- (void)setTvEpisodeGenre:(id)a3
{
}

- (NSString)tvEpisodeGenre
{
  return self->_tvEpisodeGenre;
}

- (void)setTvEpisodeSeasonName:(id)a3
{
}

- (NSString)tvEpisodeSeasonName
{
  return self->_tvEpisodeSeasonName;
}

- (void)setTvEpisodeEpisodeName:(id)a3
{
}

- (NSString)tvEpisodeEpisodeName
{
  return self->_tvEpisodeEpisodeName;
}

- (void)setPodcastEpisodeReleaseDate:(id)a3
{
}

- (NSDateComponents)podcastEpisodeReleaseDate
{
  return self->_podcastEpisodeReleaseDate;
}

- (void)setPodcastEpisodeArtist:(id)a3
{
}

- (NSString)podcastEpisodeArtist
{
  return self->_podcastEpisodeArtist;
}

- (void)setPodcastEpisodePodcastName:(id)a3
{
}

- (NSString)podcastEpisodePodcastName
{
  return self->_podcastEpisodePodcastName;
}

- (void)setPodcastEpisodeName:(id)a3
{
}

- (NSString)podcastEpisodeName
{
  return self->_podcastEpisodeName;
}

- (void)setPodcastArtist:(id)a3
{
}

- (NSString)podcastArtist
{
  return self->_podcastArtist;
}

- (void)setPodcastName:(id)a3
{
}

- (NSString)podcastName
{
  return self->_podcastName;
}

- (void)setAudioBookNarrator:(id)a3
{
}

- (NSString)audioBookNarrator
{
  return self->_audioBookNarrator;
}

- (void)setAudioBookAuthor:(id)a3
{
}

- (NSString)audioBookAuthor
{
  return self->_audioBookAuthor;
}

- (void)setAudioBookName:(id)a3
{
}

- (NSString)audioBookName
{
  return self->_audioBookName;
}

- (void)setBookAuthor:(id)a3
{
}

- (NSString)bookAuthor
{
  return self->_bookAuthor;
}

- (void)setBookName:(id)a3
{
}

- (NSString)bookName
{
  return self->_bookName;
}

- (void)setSoftwarePlatform:(id)a3
{
}

- (NSString)softwarePlatform
{
  return self->_softwarePlatform;
}

- (void)setSoftwareGenre:(id)a3
{
}

- (NSString)softwareGenre
{
  return self->_softwareGenre;
}

- (void)setSoftwareName:(id)a3
{
}

- (NSString)softwareName
{
  return self->_softwareName;
}

- (void)setRadioCurator:(id)a3
{
}

- (NSString)radioCurator
{
  return self->_radioCurator;
}

- (void)setRadioName:(id)a3
{
}

- (NSString)radioName
{
  return self->_radioName;
}

- (void)setPlaylistCurator:(id)a3
{
}

- (NSString)playlistCurator
{
  return self->_playlistCurator;
}

- (void)setPlaylistName:(id)a3
{
}

- (NSString)playlistName
{
  return self->_playlistName;
}

- (void)setArtistGenre:(id)a3
{
}

- (NSString)artistGenre
{
  return self->_artistGenre;
}

- (void)setArtistName:(id)a3
{
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setMusicVideoArtist:(id)a3
{
}

- (NSString)musicVideoArtist
{
  return self->_musicVideoArtist;
}

- (void)setMusicVideoName:(id)a3
{
}

- (NSString)musicVideoName
{
  return self->_musicVideoName;
}

- (void)setAlbumArtist:(id)a3
{
}

- (NSString)albumArtist
{
  return self->_albumArtist;
}

- (void)setAlbumName:(id)a3
{
}

- (NSString)albumName
{
  return self->_albumName;
}

- (void)setSongAlbum:(id)a3
{
}

- (NSString)songAlbum
{
  return self->_songAlbum;
}

- (void)setSongArtist:(id)a3
{
}

- (NSString)songArtist
{
  return self->_songArtist;
}

- (void)setSongTitle:(id)a3
{
}

- (NSString)songTitle
{
  return self->_songTitle;
}

- (void)setITunesStoreFrontIdentifier:(id)a3
{
}

- (NSString)iTunesStoreFrontIdentifier
{
  return self->_iTunesStoreFrontIdentifier;
}

- (void)setITunesStoreIdentifier:(id)a3
{
}

- (NSString)iTunesStoreIdentifier
{
  return self->_iTunesStoreIdentifier;
}

- (void)setLinkMediaType:(int64_t)a3
{
  self->_linkMediaType = a3;
}

- (int64_t)linkMediaType
{
  return self->_linkMediaType;
}

- (void)setCreator:(id)a3
{
}

- (NSString)creator
{
  return self->_creator;
}

- (void)setIconURLs:(id)a3
{
}

- (NSArray)iconURLs
{
  return self->_iconURLs;
}

- (void)setImageURLs:(id)a3
{
}

- (NSArray)imageURLs
{
  return self->_imageURLs;
}

- (void)setOriginalURL:(id)a3
{
}

- (NSString)originalURL
{
  return self->_originalURL;
}

- (void)setItemType:(id)a3
{
}

- (NSString)itemType
{
  return self->_itemType;
}

- (void)setLinkURL:(NSURL *)linkURL
{
}

- (NSURL)linkURL
{
  return self->_linkURL;
}

- (void)setOpenGraphType:(NSString *)openGraphType
{
}

- (NSString)openGraphType
{
  return self->_openGraphType;
}

- (void)setTitle:(NSString *)title
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setSummary:(NSString *)summary
{
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSiteName:(NSString *)siteName
{
}

- (NSString)siteName
{
  return self->_siteName;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INMessageLinkMetadata;
  v6 = [(INMessageLinkMetadata *)&v11 description];
  v7 = [(INMessageLinkMetadata *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INMessageLinkMetadata *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_siteName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"siteName");

  v9 = [v6 encodeObject:self->_summary];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"summary");

  v10 = [v6 encodeObject:self->_title];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"title");

  objc_super v11 = [v6 encodeObject:self->_openGraphType];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"openGraphType");

  v12 = [v6 encodeObject:self->_itemType];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"itemType");

  v13 = [v6 encodeObject:self->_linkURL];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"linkURL");

  v14 = [v6 encodeObject:self->_originalURL];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, @"originalURL");

  v15 = [v6 encodeObject:self->_imageURLs];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, @"imageURLs");

  v16 = [v6 encodeObject:self->_iconURLs];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, @"iconURLs");

  v17 = [v6 encodeObject:self->_creator];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v17, @"creator");

  unint64_t v18 = self->_linkMediaType - 1;
  if (v18 > 0x10) {
    v19 = @"unknown";
  }
  else {
    v19 = *(&off_1E551E960 + v18);
  }
  v20 = v19;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v20, @"linkMediaType");

  v21 = [v6 encodeObject:self->_iTunesStoreIdentifier];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v21, @"iTunesStoreIdentifier");

  v22 = [v6 encodeObject:self->_iTunesStoreFrontIdentifier];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v22, @"iTunesStoreFrontIdentifier");

  v23 = [v6 encodeObject:self->_songTitle];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v23, @"songTitle");

  v24 = [v6 encodeObject:self->_songArtist];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v24, @"songArtist");

  v25 = [v6 encodeObject:self->_songAlbum];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v25, @"songAlbum");

  v26 = [v6 encodeObject:self->_albumName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v26, @"albumName");

  v27 = [v6 encodeObject:self->_albumArtist];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v27, @"albumArtist");

  v28 = [v6 encodeObject:self->_musicVideoName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v28, @"musicVideoName");

  v29 = [v6 encodeObject:self->_musicVideoArtist];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v29, @"musicVideoArtist");

  v30 = [v6 encodeObject:self->_artistName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v30, @"artistName");

  v31 = [v6 encodeObject:self->_artistGenre];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v31, @"artistGenre");

  v32 = [v6 encodeObject:self->_playlistName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v32, @"playlistName");

  v33 = [v6 encodeObject:self->_playlistCurator];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v33, @"playlistCurator");

  v34 = [v6 encodeObject:self->_radioName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v34, @"radioName");

  v35 = [v6 encodeObject:self->_radioCurator];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v35, @"radioCurator");

  v36 = [v6 encodeObject:self->_softwareName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v36, @"softwareName");

  v37 = [v6 encodeObject:self->_softwareGenre];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v37, @"softwareGenre");

  v38 = [v6 encodeObject:self->_softwarePlatform];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v38, @"softwarePlatform");

  v39 = [v6 encodeObject:self->_bookName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v39, @"bookName");

  v40 = [v6 encodeObject:self->_bookAuthor];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v40, @"bookAuthor");

  v41 = [v6 encodeObject:self->_audioBookName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v41, @"audioBookName");

  v42 = [v6 encodeObject:self->_audioBookAuthor];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v42, @"audioBookAuthor");

  v43 = [v6 encodeObject:self->_audioBookNarrator];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v43, @"audioBookNarrator");

  v44 = [v6 encodeObject:self->_podcastName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v44, @"podcastName");

  v45 = [v6 encodeObject:self->_podcastArtist];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v45, @"podcastArtist");

  v46 = [v6 encodeObject:self->_podcastEpisodeName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v46, @"podcastEpisodeName");

  v47 = [v6 encodeObject:self->_podcastEpisodePodcastName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v47, @"podcastEpisodePodcastName");

  v48 = [v6 encodeObject:self->_podcastEpisodeArtist];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v48, @"podcastEpisodeArtist");

  uint64_t v49 = [v6 encodeObject:self->_podcastEpisodeReleaseDate];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v49, @"podcastEpisodeReleaseDate");

  v50 = [v6 encodeObject:self->_tvEpisodeEpisodeName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v50, @"tvEpisodeEpisodeName");

  uint64_t v51 = [v6 encodeObject:self->_tvEpisodeSeasonName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v51, @"tvEpisodeSeasonName");

  v52 = [v6 encodeObject:self->_tvEpisodeGenre];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v52, @"tvEpisodeGenre");

  uint64_t v53 = [v6 encodeObject:self->_tvSeasonName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v53, @"tvSeasonName");

  v54 = [v6 encodeObject:self->_tvSeasonGenre];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v54, @"tvSeasonGenre");

  v55 = [v6 encodeObject:self->_movieName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v55, @"movieName");

  v56 = [v6 encodeObject:self->_movieGenre];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v56, @"movieGenre");

  v57 = [v6 encodeObject:self->_tvShowName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v57, @"tvShowName");

  v58 = [v6 encodeObject:self->_movieBundleName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v58, @"movieBundleName");

  v59 = [v6 encodeObject:self->_movieBundleGenre];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v59, @"movieBundleGenre");

  v60 = [v6 encodeObject:self->_appleTvTitle];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v60, @"appleTvTitle");

  v61 = [v6 encodeObject:self->_appleTvSubtitle];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v61, @"appleTvSubtitle");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t siteName = self->_siteName;
  id v5 = a3;
  [v5 encodeObject:siteName forKey:@"siteName"];
  [v5 encodeObject:self->_summary forKey:@"summary"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_openGraphType forKey:@"openGraphType"];
  [v5 encodeObject:self->_itemType forKey:@"itemType"];
  [v5 encodeObject:self->_linkURL forKey:@"linkURL"];
  [v5 encodeObject:self->_originalURL forKey:@"originalURL"];
  [v5 encodeObject:self->_imageURLs forKey:@"imageURLs"];
  [v5 encodeObject:self->_iconURLs forKey:@"iconURLs"];
  [v5 encodeObject:self->_creator forKey:@"creator"];
  [v5 encodeInteger:self->_linkMediaType forKey:@"linkMediaType"];
  [v5 encodeObject:self->_iTunesStoreIdentifier forKey:@"iTunesStoreIdentifier"];
  [v5 encodeObject:self->_iTunesStoreFrontIdentifier forKey:@"iTunesStoreFrontIdentifier"];
  [v5 encodeObject:self->_songTitle forKey:@"songTitle"];
  [v5 encodeObject:self->_songArtist forKey:@"songArtist"];
  [v5 encodeObject:self->_songAlbum forKey:@"songAlbum"];
  [v5 encodeObject:self->_albumName forKey:@"albumName"];
  [v5 encodeObject:self->_albumArtist forKey:@"albumArtist"];
  [v5 encodeObject:self->_musicVideoName forKey:@"musicVideoName"];
  [v5 encodeObject:self->_musicVideoArtist forKey:@"musicVideoArtist"];
  [v5 encodeObject:self->_artistName forKey:@"artistName"];
  [v5 encodeObject:self->_artistGenre forKey:@"artistGenre"];
  [v5 encodeObject:self->_playlistName forKey:@"playlistName"];
  [v5 encodeObject:self->_playlistCurator forKey:@"playlistCurator"];
  [v5 encodeObject:self->_radioName forKey:@"radioName"];
  [v5 encodeObject:self->_radioCurator forKey:@"radioCurator"];
  [v5 encodeObject:self->_softwareName forKey:@"softwareName"];
  [v5 encodeObject:self->_softwareGenre forKey:@"softwareGenre"];
  [v5 encodeObject:self->_softwarePlatform forKey:@"softwarePlatform"];
  [v5 encodeObject:self->_bookName forKey:@"bookName"];
  [v5 encodeObject:self->_bookAuthor forKey:@"bookAuthor"];
  [v5 encodeObject:self->_audioBookName forKey:@"audioBookName"];
  [v5 encodeObject:self->_audioBookAuthor forKey:@"audioBookAuthor"];
  [v5 encodeObject:self->_audioBookNarrator forKey:@"audioBookNarrator"];
  [v5 encodeObject:self->_podcastName forKey:@"podcastName"];
  [v5 encodeObject:self->_podcastArtist forKey:@"podcastArtist"];
  [v5 encodeObject:self->_podcastEpisodeName forKey:@"podcastEpisodeName"];
  [v5 encodeObject:self->_podcastEpisodePodcastName forKey:@"podcastEpisodePodcastName"];
  [v5 encodeObject:self->_podcastEpisodeArtist forKey:@"podcastEpisodeArtist"];
  [v5 encodeObject:self->_podcastEpisodeReleaseDate forKey:@"podcastEpisodeReleaseDate"];
  [v5 encodeObject:self->_tvEpisodeEpisodeName forKey:@"tvEpisodeEpisodeName"];
  [v5 encodeObject:self->_tvEpisodeSeasonName forKey:@"tvEpisodeSeasonName"];
  [v5 encodeObject:self->_tvEpisodeGenre forKey:@"tvEpisodeGenre"];
  [v5 encodeObject:self->_tvSeasonName forKey:@"tvSeasonName"];
  [v5 encodeObject:self->_tvSeasonGenre forKey:@"tvSeasonGenre"];
  [v5 encodeObject:self->_movieName forKey:@"movieName"];
  [v5 encodeObject:self->_movieGenre forKey:@"movieGenre"];
  [v5 encodeObject:self->_tvShowName forKey:@"tvShowName"];
  [v5 encodeObject:self->_movieBundleName forKey:@"movieBundleName"];
  [v5 encodeObject:self->_movieBundleGenre forKey:@"movieBundleGenre"];
  [v5 encodeObject:self->_appleTvTitle forKey:@"appleTvTitle"];
  [v5 encodeObject:self->_appleTvSubtitle forKey:@"appleTvSubtitle"];
}

- (INMessageLinkMetadata)initWithCoder:(id)a3
{
  v207[3] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v205 = [v4 decodeObjectOfClasses:v6 forKey:@"siteName"];

  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v204 = [v4 decodeObjectOfClasses:v9 forKey:@"summary"];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v203 = [v4 decodeObjectOfClasses:v12 forKey:@"title"];

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v202 = [v4 decodeObjectOfClasses:v15 forKey:@"openGraphType"];

  v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  unint64_t v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v201 = [v4 decodeObjectOfClasses:v18 forKey:@"itemType"];

  v200 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linkURL"];
  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = objc_opt_class();
  v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  v199 = [v4 decodeObjectOfClasses:v21 forKey:@"originalURL"];

  v22 = (void *)MEMORY[0x1E4F1CAD0];
  v207[0] = objc_opt_class();
  v207[1] = objc_opt_class();
  v207[2] = objc_opt_class();
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v207 count:3];
  v24 = [v22 setWithArray:v23];
  v198 = [v4 decodeObjectOfClasses:v24 forKey:@"imageURLs"];

  v25 = (void *)MEMORY[0x1E4F1CAD0];
  v206[0] = objc_opt_class();
  v206[1] = objc_opt_class();
  v206[2] = objc_opt_class();
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v206 count:3];
  v27 = [v25 setWithArray:v26];
  v197 = [v4 decodeObjectOfClasses:v27 forKey:@"iconURLs"];

  v28 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v29 = objc_opt_class();
  v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
  v196 = [v4 decodeObjectOfClasses:v30 forKey:@"creator"];

  uint64_t v167 = [v4 decodeIntegerForKey:@"linkMediaType"];
  v31 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v32 = objc_opt_class();
  v33 = objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
  v195 = [v4 decodeObjectOfClasses:v33 forKey:@"iTunesStoreIdentifier"];

  v34 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v35 = objc_opt_class();
  v36 = objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
  v194 = [v4 decodeObjectOfClasses:v36 forKey:@"iTunesStoreFrontIdentifier"];

  v37 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v38 = objc_opt_class();
  v39 = objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
  v193 = [v4 decodeObjectOfClasses:v39 forKey:@"songTitle"];

  v40 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v41 = objc_opt_class();
  v42 = objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
  v192 = [v4 decodeObjectOfClasses:v42 forKey:@"songArtist"];

  v43 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v44 = objc_opt_class();
  v45 = objc_msgSend(v43, "setWithObjects:", v44, objc_opt_class(), 0);
  v191 = [v4 decodeObjectOfClasses:v45 forKey:@"songAlbum"];

  v46 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v47 = objc_opt_class();
  v48 = objc_msgSend(v46, "setWithObjects:", v47, objc_opt_class(), 0);
  v190 = [v4 decodeObjectOfClasses:v48 forKey:@"albumName"];

  uint64_t v49 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v50 = objc_opt_class();
  uint64_t v51 = objc_msgSend(v49, "setWithObjects:", v50, objc_opt_class(), 0);
  v189 = [v4 decodeObjectOfClasses:v51 forKey:@"albumArtist"];

  v52 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v53 = objc_opt_class();
  v54 = objc_msgSend(v52, "setWithObjects:", v53, objc_opt_class(), 0);
  v188 = [v4 decodeObjectOfClasses:v54 forKey:@"musicVideoName"];

  v55 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v56 = objc_opt_class();
  v57 = objc_msgSend(v55, "setWithObjects:", v56, objc_opt_class(), 0);
  v187 = [v4 decodeObjectOfClasses:v57 forKey:@"musicVideoArtist"];

  v58 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v59 = objc_opt_class();
  v60 = objc_msgSend(v58, "setWithObjects:", v59, objc_opt_class(), 0);
  v186 = [v4 decodeObjectOfClasses:v60 forKey:@"artistName"];

  v61 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v62 = objc_opt_class();
  uint64_t v63 = objc_msgSend(v61, "setWithObjects:", v62, objc_opt_class(), 0);
  v185 = [v4 decodeObjectOfClasses:v63 forKey:@"artistGenre"];

  v64 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v65 = objc_opt_class();
  v66 = objc_msgSend(v64, "setWithObjects:", v65, objc_opt_class(), 0);
  v184 = [v4 decodeObjectOfClasses:v66 forKey:@"playlistName"];

  v67 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v68 = objc_opt_class();
  v69 = objc_msgSend(v67, "setWithObjects:", v68, objc_opt_class(), 0);
  v183 = [v4 decodeObjectOfClasses:v69 forKey:@"playlistCurator"];

  v70 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v71 = objc_opt_class();
  v72 = objc_msgSend(v70, "setWithObjects:", v71, objc_opt_class(), 0);
  v182 = [v4 decodeObjectOfClasses:v72 forKey:@"radioName"];

  v73 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v74 = objc_opt_class();
  v75 = objc_msgSend(v73, "setWithObjects:", v74, objc_opt_class(), 0);
  v181 = [v4 decodeObjectOfClasses:v75 forKey:@"radioCurator"];

  v76 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v77 = objc_opt_class();
  v78 = objc_msgSend(v76, "setWithObjects:", v77, objc_opt_class(), 0);
  v180 = [v4 decodeObjectOfClasses:v78 forKey:@"softwareName"];

  v79 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v80 = objc_opt_class();
  v81 = objc_msgSend(v79, "setWithObjects:", v80, objc_opt_class(), 0);
  v179 = [v4 decodeObjectOfClasses:v81 forKey:@"softwareGenre"];

  v82 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v83 = objc_opt_class();
  v84 = objc_msgSend(v82, "setWithObjects:", v83, objc_opt_class(), 0);
  v178 = [v4 decodeObjectOfClasses:v84 forKey:@"softwarePlatform"];

  v85 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v86 = objc_opt_class();
  v87 = objc_msgSend(v85, "setWithObjects:", v86, objc_opt_class(), 0);
  v177 = [v4 decodeObjectOfClasses:v87 forKey:@"bookName"];

  v88 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v89 = objc_opt_class();
  v90 = objc_msgSend(v88, "setWithObjects:", v89, objc_opt_class(), 0);
  v176 = [v4 decodeObjectOfClasses:v90 forKey:@"bookAuthor"];

  v91 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v92 = objc_opt_class();
  v93 = objc_msgSend(v91, "setWithObjects:", v92, objc_opt_class(), 0);
  v175 = [v4 decodeObjectOfClasses:v93 forKey:@"audioBookName"];

  v94 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v95 = objc_opt_class();
  v96 = objc_msgSend(v94, "setWithObjects:", v95, objc_opt_class(), 0);
  v174 = [v4 decodeObjectOfClasses:v96 forKey:@"audioBookAuthor"];

  v97 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v98 = objc_opt_class();
  v99 = objc_msgSend(v97, "setWithObjects:", v98, objc_opt_class(), 0);
  v173 = [v4 decodeObjectOfClasses:v99 forKey:@"audioBookNarrator"];

  v100 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v101 = objc_opt_class();
  uint64_t v102 = objc_msgSend(v100, "setWithObjects:", v101, objc_opt_class(), 0);
  v172 = [v4 decodeObjectOfClasses:v102 forKey:@"podcastName"];

  uint64_t v103 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v104 = objc_opt_class();
  uint64_t v105 = objc_msgSend(v103, "setWithObjects:", v104, objc_opt_class(), 0);
  v171 = [v4 decodeObjectOfClasses:v105 forKey:@"podcastArtist"];

  uint64_t v106 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v107 = objc_opt_class();
  uint64_t v108 = objc_msgSend(v106, "setWithObjects:", v107, objc_opt_class(), 0);
  v170 = [v4 decodeObjectOfClasses:v108 forKey:@"podcastEpisodeName"];

  uint64_t v109 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v110 = objc_opt_class();
  uint64_t v111 = objc_msgSend(v109, "setWithObjects:", v110, objc_opt_class(), 0);
  v166 = [v4 decodeObjectOfClasses:v111 forKey:@"podcastEpisodePodcastName"];

  uint64_t v112 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v113 = objc_opt_class();
  uint64_t v114 = objc_msgSend(v112, "setWithObjects:", v113, objc_opt_class(), 0);
  v165 = [v4 decodeObjectOfClasses:v114 forKey:@"podcastEpisodeArtist"];

  v164 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"podcastEpisodeReleaseDate"];
  uint64_t v115 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v116 = objc_opt_class();
  uint64_t v117 = objc_msgSend(v115, "setWithObjects:", v116, objc_opt_class(), 0);
  v163 = [v4 decodeObjectOfClasses:v117 forKey:@"tvEpisodeEpisodeName"];

  uint64_t v118 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v119 = objc_opt_class();
  uint64_t v120 = objc_msgSend(v118, "setWithObjects:", v119, objc_opt_class(), 0);
  v162 = [v4 decodeObjectOfClasses:v120 forKey:@"tvEpisodeSeasonName"];

  uint64_t v121 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v122 = objc_opt_class();
  uint64_t v123 = objc_msgSend(v121, "setWithObjects:", v122, objc_opt_class(), 0);
  v161 = [v4 decodeObjectOfClasses:v123 forKey:@"tvEpisodeGenre"];

  uint64_t v124 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v125 = objc_opt_class();
  uint64_t v126 = objc_msgSend(v124, "setWithObjects:", v125, objc_opt_class(), 0);
  v160 = [v4 decodeObjectOfClasses:v126 forKey:@"tvSeasonName"];

  v127 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v128 = objc_opt_class();
  uint64_t v129 = objc_msgSend(v127, "setWithObjects:", v128, objc_opt_class(), 0);
  v159 = [v4 decodeObjectOfClasses:v129 forKey:@"tvSeasonGenre"];

  v130 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v131 = objc_opt_class();
  v132 = objc_msgSend(v130, "setWithObjects:", v131, objc_opt_class(), 0);
  v158 = [v4 decodeObjectOfClasses:v132 forKey:@"movieName"];

  uint64_t v133 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v134 = objc_opt_class();
  uint64_t v135 = objc_msgSend(v133, "setWithObjects:", v134, objc_opt_class(), 0);
  v157 = [v4 decodeObjectOfClasses:v135 forKey:@"movieGenre"];

  v136 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v137 = objc_opt_class();
  v138 = objc_msgSend(v136, "setWithObjects:", v137, objc_opt_class(), 0);
  uint64_t v156 = [v4 decodeObjectOfClasses:v138 forKey:@"tvShowName"];

  uint64_t v139 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v140 = objc_opt_class();
  uint64_t v141 = objc_msgSend(v139, "setWithObjects:", v140, objc_opt_class(), 0);
  uint64_t v155 = [v4 decodeObjectOfClasses:v141 forKey:@"movieBundleName"];

  v142 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v143 = objc_opt_class();
  v144 = objc_msgSend(v142, "setWithObjects:", v143, objc_opt_class(), 0);
  uint64_t v154 = [v4 decodeObjectOfClasses:v144 forKey:@"movieBundleGenre"];

  uint64_t v145 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v146 = objc_opt_class();
  uint64_t v147 = objc_msgSend(v145, "setWithObjects:", v146, objc_opt_class(), 0);
  uint64_t v153 = [v4 decodeObjectOfClasses:v147 forKey:@"appleTvTitle"];

  uint64_t v148 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v149 = objc_opt_class();
  uint64_t v150 = objc_msgSend(v148, "setWithObjects:", v149, objc_opt_class(), 0);
  uint64_t v151 = [v4 decodeObjectOfClasses:v150 forKey:@"appleTvSubtitle"];

  v169 = -[INMessageLinkMetadata initWithSiteName:summary:title:openGraphType:itemType:linkURL:originalURL:imageURLs:iconURLs:creator:linkMediaType:iTunesStoreIdentifier:iTunesStoreFrontIdentifier:songTitle:songArtist:songAlbum:albumName:albumArtist:musicVideoName:musicVideoArtist:artistName:artistGenre:playlistName:playlistCurator:radioName:radioCurator:softwareName:softwareGenre:softwarePlatform:bookName:bookAuthor:audioBookName:audioBookAuthor:audioBookNarrator:podcastName:podcastArtist:podcastEpisodeName:podcastEpisodePodcastName:podcastEpisodeArtist:podcastEpisodeReleaseDate:tvEpisodeEpisodeName:tvEpisodeSeasonName:tvEpisodeGenre:tvSeasonName:tvSeasonGenre:movieName:movieGenre:tvShowName:movieBundleName:movieBundleGenre:appleTvTitle:appleTvSubtitle:](self, "initWithSiteName:summary:title:openGraphType:itemType:linkURL:originalURL:imageURLs:iconURLs:creator:linkMediaType:iTunesStoreIdentifier:iTunesStoreFrontIdentifier:songTitle:songArtist:songAlbum:albumName:albumArtist:musicVideoName:musicVideoArtist:artistName:artistGenre:playlistName:playlistCurator:radioName:radioCurator:softwareName:softwareGenre:softwarePlatform:bookName:bookAuthor:audioBookName:audioBookAuthor:audioBookNarrator:podcastName:podcastArtist:podcastEpisodeName:podcastEpisodePodcastName:podcastEpisodeArtist:podcastEpisodeReleaseDate:tvEpisodeEpisodeName:tvEpisodeSeasonName:tvEpisodeGenre:tvSeasonName:tvSeasonGenre:movieName:movieGenre:tvShowName:movieBundleName:movieBundleGenre:appleTvTitle:appleTvSubtitle:", v205, v204, v203, v202, v201, v200, v199, v198, v197, v196, v167,
           v195,
           v194,
           v193,
           v192,
           v191,
           v190,
           v189,
           v188,
           v187,
           v186,
           v185,
           v184,
           v183,
           v182,
           v181,
           v180,
           v179,
           v178,
           v177,
           v176,
           v175,
           v174,
           v173,
           v172,
           v171,
           v170,
           v166,
           v165,
           v164,
           v163,
           v162,
           v161,
           v160,
           v159,
           v158,
           v157,
           v156,
           v155,
           v154,
           v153,
           v151);

  return v169;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INMessageLinkMetadata *)a3;
  if (v4 == self)
  {
    BOOL v57 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t siteName = self->_siteName;
      if (siteName != v5->_siteName && !-[NSString isEqual:](siteName, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t summary = self->_summary;
      if (summary != v5->_summary && !-[NSString isEqual:](summary, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t title = self->_title;
      if (title != v5->_title && !-[NSString isEqual:](title, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t openGraphType = self->_openGraphType;
      if (openGraphType != v5->_openGraphType && !-[NSString isEqual:](openGraphType, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t itemType = self->_itemType;
      if (itemType != v5->_itemType && !-[NSString isEqual:](itemType, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t linkURL = self->_linkURL;
      if (linkURL != v5->_linkURL && !-[NSURL isEqual:](linkURL, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t originalURL = self->_originalURL;
      if (originalURL != v5->_originalURL && !-[NSString isEqual:](originalURL, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t imageURLs = self->_imageURLs;
      if (imageURLs != v5->_imageURLs && !-[NSArray isEqual:](imageURLs, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t iconURLs = self->_iconURLs;
      if (iconURLs != v5->_iconURLs && !-[NSArray isEqual:](iconURLs, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t creator = self->_creator;
      if (creator != v5->_creator && !-[NSString isEqual:](creator, "isEqual:")) {
        goto LABEL_109;
      }
      if (self->_linkMediaType != v5->_linkMediaType) {
        goto LABEL_109;
      }
      uint64_t iTunesStoreIdentifier = self->_iTunesStoreIdentifier;
      if (iTunesStoreIdentifier != v5->_iTunesStoreIdentifier
        && !-[NSString isEqual:](iTunesStoreIdentifier, "isEqual:"))
      {
        goto LABEL_109;
      }
      uint64_t iTunesStoreFrontIdentifier = self->_iTunesStoreFrontIdentifier;
      if (iTunesStoreFrontIdentifier != v5->_iTunesStoreFrontIdentifier
        && !-[NSString isEqual:](iTunesStoreFrontIdentifier, "isEqual:"))
      {
        goto LABEL_109;
      }
      uint64_t songTitle = self->_songTitle;
      if (songTitle != v5->_songTitle && !-[NSString isEqual:](songTitle, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t songArtist = self->_songArtist;
      if (songArtist != v5->_songArtist && !-[NSString isEqual:](songArtist, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t songAlbum = self->_songAlbum;
      if (songAlbum != v5->_songAlbum && !-[NSString isEqual:](songAlbum, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t albumName = self->_albumName;
      if (albumName != v5->_albumName && !-[NSString isEqual:](albumName, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t albumArtist = self->_albumArtist;
      if (albumArtist != v5->_albumArtist && !-[NSString isEqual:](albumArtist, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t musicVideoName = self->_musicVideoName;
      if (musicVideoName != v5->_musicVideoName && !-[NSString isEqual:](musicVideoName, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t musicVideoArtist = self->_musicVideoArtist;
      if (musicVideoArtist != v5->_musicVideoArtist
        && !-[NSString isEqual:](musicVideoArtist, "isEqual:"))
      {
        goto LABEL_109;
      }
      uint64_t artistName = self->_artistName;
      if (artistName != v5->_artistName && !-[NSString isEqual:](artistName, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t artistGenre = self->_artistGenre;
      if (artistGenre != v5->_artistGenre && !-[NSString isEqual:](artistGenre, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t playlistName = self->_playlistName;
      if (playlistName != v5->_playlistName && !-[NSString isEqual:](playlistName, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t playlistCurator = self->_playlistCurator;
      if (playlistCurator != v5->_playlistCurator && !-[NSString isEqual:](playlistCurator, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t radioName = self->_radioName;
      if (radioName != v5->_radioName && !-[NSString isEqual:](radioName, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t radioCurator = self->_radioCurator;
      if (radioCurator != v5->_radioCurator && !-[NSString isEqual:](radioCurator, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t softwareName = self->_softwareName;
      if (softwareName != v5->_softwareName && !-[NSString isEqual:](softwareName, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t softwareGenre = self->_softwareGenre;
      if (softwareGenre != v5->_softwareGenre && !-[NSString isEqual:](softwareGenre, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t softwarePlatform = self->_softwarePlatform;
      if (softwarePlatform != v5->_softwarePlatform
        && !-[NSString isEqual:](softwarePlatform, "isEqual:"))
      {
        goto LABEL_109;
      }
      uint64_t bookName = self->_bookName;
      if (bookName != v5->_bookName && !-[NSString isEqual:](bookName, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t bookAuthor = self->_bookAuthor;
      if (bookAuthor != v5->_bookAuthor && !-[NSString isEqual:](bookAuthor, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t audioBookName = self->_audioBookName;
      if (audioBookName != v5->_audioBookName && !-[NSString isEqual:](audioBookName, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t audioBookAuthor = self->_audioBookAuthor;
      if (audioBookAuthor != v5->_audioBookAuthor && !-[NSString isEqual:](audioBookAuthor, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t audioBookNarrator = self->_audioBookNarrator;
      if (audioBookNarrator != v5->_audioBookNarrator
        && !-[NSString isEqual:](audioBookNarrator, "isEqual:"))
      {
        goto LABEL_109;
      }
      uint64_t podcastName = self->_podcastName;
      if (podcastName != v5->_podcastName && !-[NSString isEqual:](podcastName, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t podcastArtist = self->_podcastArtist;
      if (podcastArtist != v5->_podcastArtist && !-[NSString isEqual:](podcastArtist, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t podcastEpisodeName = self->_podcastEpisodeName;
      if (podcastEpisodeName != v5->_podcastEpisodeName
        && !-[NSString isEqual:](podcastEpisodeName, "isEqual:"))
      {
        goto LABEL_109;
      }
      uint64_t podcastEpisodePodcastName = self->_podcastEpisodePodcastName;
      if (podcastEpisodePodcastName != v5->_podcastEpisodePodcastName
        && !-[NSString isEqual:](podcastEpisodePodcastName, "isEqual:"))
      {
        goto LABEL_109;
      }
      uint64_t podcastEpisodeArtist = self->_podcastEpisodeArtist;
      if (podcastEpisodeArtist != v5->_podcastEpisodeArtist
        && !-[NSString isEqual:](podcastEpisodeArtist, "isEqual:"))
      {
        goto LABEL_109;
      }
      uint64_t podcastEpisodeReleaseDate = self->_podcastEpisodeReleaseDate;
      if (podcastEpisodeReleaseDate != v5->_podcastEpisodeReleaseDate
        && !-[NSDateComponents isEqual:](podcastEpisodeReleaseDate, "isEqual:"))
      {
        goto LABEL_109;
      }
      uint64_t tvEpisodeEpisodeName = self->_tvEpisodeEpisodeName;
      if (tvEpisodeEpisodeName != v5->_tvEpisodeEpisodeName
        && !-[NSString isEqual:](tvEpisodeEpisodeName, "isEqual:"))
      {
        goto LABEL_109;
      }
      uint64_t tvEpisodeSeasonName = self->_tvEpisodeSeasonName;
      if (tvEpisodeSeasonName != v5->_tvEpisodeSeasonName
        && !-[NSString isEqual:](tvEpisodeSeasonName, "isEqual:"))
      {
        goto LABEL_109;
      }
      uint64_t tvEpisodeGenre = self->_tvEpisodeGenre;
      if (tvEpisodeGenre != v5->_tvEpisodeGenre && !-[NSString isEqual:](tvEpisodeGenre, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t tvSeasonName = self->_tvSeasonName;
      if (tvSeasonName != v5->_tvSeasonName && !-[NSString isEqual:](tvSeasonName, "isEqual:")) {
        goto LABEL_109;
      }
      uint64_t tvSeasonGenre = self->_tvSeasonGenre;
      if (tvSeasonGenre != v5->_tvSeasonGenre && !-[NSString isEqual:](tvSeasonGenre, "isEqual:")) {
        goto LABEL_109;
      }
      if (((uint64_t movieName = self->_movieName, movieName == v5->_movieName)
         || -[NSString isEqual:](movieName, "isEqual:"))
        && ((movieGenre = self->_movieGenre, movieGenre == v5->_movieGenre)
         || -[NSString isEqual:](movieGenre, "isEqual:"))
        && ((tvShowName = self->_tvShowName, tvShowName == v5->_tvShowName)
         || -[NSString isEqual:](tvShowName, "isEqual:"))
        && ((movieBundleName = self->_movieBundleName, movieBundleName == v5->_movieBundleName)
         || -[NSString isEqual:](movieBundleName, "isEqual:"))
        && ((movieBundleGenre = self->_movieBundleGenre, movieBundleGenre == v5->_movieBundleGenre)
         || -[NSString isEqual:](movieBundleGenre, "isEqual:"))
        && ((appleTvTitle = self->_appleTvTitle, appleTvTitle == v5->_appleTvTitle)
         || -[NSString isEqual:](appleTvTitle, "isEqual:"))
        && ((appleTvSubuint64_t title = self->_appleTvSubtitle, appleTvSubtitle == v5->_appleTvSubtitle)
         || -[NSString isEqual:](appleTvSubtitle, "isEqual:")))
      {
        BOOL v57 = 1;
      }
      else
      {
LABEL_109:
        BOOL v57 = 0;
      }
    }
    else
    {
      BOOL v57 = 0;
    }
  }

  return v57;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_siteName hash];
  NSUInteger v4 = [(NSString *)self->_summary hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_title hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_openGraphType hash];
  NSUInteger v7 = [(NSString *)self->_itemType hash];
  uint64_t v8 = v7 ^ [(NSURL *)self->_linkURL hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_originalURL hash];
  uint64_t v10 = [(NSArray *)self->_imageURLs hash];
  uint64_t v11 = v10 ^ [(NSArray *)self->_iconURLs hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_creator hash];
  v13 = [NSNumber numberWithInteger:self->_linkMediaType];
  uint64_t v14 = v9 ^ v12 ^ [v13 hash];
  NSUInteger v15 = [(NSString *)self->_iTunesStoreIdentifier hash];
  NSUInteger v16 = v15 ^ [(NSString *)self->_iTunesStoreFrontIdentifier hash];
  NSUInteger v17 = v16 ^ [(NSString *)self->_songTitle hash];
  NSUInteger v18 = v17 ^ [(NSString *)self->_songArtist hash];
  NSUInteger v19 = v14 ^ v18 ^ [(NSString *)self->_songAlbum hash];
  NSUInteger v20 = [(NSString *)self->_albumName hash];
  NSUInteger v21 = v20 ^ [(NSString *)self->_albumArtist hash];
  NSUInteger v22 = v21 ^ [(NSString *)self->_musicVideoName hash];
  NSUInteger v23 = v22 ^ [(NSString *)self->_musicVideoArtist hash];
  NSUInteger v24 = v23 ^ [(NSString *)self->_artistName hash];
  NSUInteger v25 = v19 ^ v24 ^ [(NSString *)self->_artistGenre hash];
  NSUInteger v26 = [(NSString *)self->_playlistName hash];
  NSUInteger v27 = v26 ^ [(NSString *)self->_playlistCurator hash];
  NSUInteger v28 = v27 ^ [(NSString *)self->_radioName hash];
  NSUInteger v29 = v28 ^ [(NSString *)self->_radioCurator hash];
  NSUInteger v30 = v29 ^ [(NSString *)self->_softwareName hash];
  NSUInteger v31 = v30 ^ [(NSString *)self->_softwareGenre hash];
  NSUInteger v32 = v25 ^ v31 ^ [(NSString *)self->_softwarePlatform hash];
  NSUInteger v33 = [(NSString *)self->_bookName hash];
  NSUInteger v34 = v33 ^ [(NSString *)self->_bookAuthor hash];
  NSUInteger v35 = v34 ^ [(NSString *)self->_audioBookName hash];
  NSUInteger v36 = v35 ^ [(NSString *)self->_audioBookAuthor hash];
  NSUInteger v37 = v36 ^ [(NSString *)self->_audioBookNarrator hash];
  NSUInteger v38 = v37 ^ [(NSString *)self->_podcastName hash];
  NSUInteger v39 = v38 ^ [(NSString *)self->_podcastArtist hash];
  NSUInteger v40 = v32 ^ v39 ^ [(NSString *)self->_podcastEpisodeName hash];
  NSUInteger v41 = [(NSString *)self->_podcastEpisodePodcastName hash];
  NSUInteger v42 = v41 ^ [(NSString *)self->_podcastEpisodeArtist hash];
  uint64_t v43 = v42 ^ [(NSDateComponents *)self->_podcastEpisodeReleaseDate hash];
  NSUInteger v44 = v43 ^ [(NSString *)self->_tvEpisodeEpisodeName hash];
  NSUInteger v45 = v44 ^ [(NSString *)self->_tvEpisodeSeasonName hash];
  NSUInteger v46 = v45 ^ [(NSString *)self->_tvEpisodeGenre hash];
  NSUInteger v47 = v46 ^ [(NSString *)self->_tvSeasonName hash];
  NSUInteger v48 = v47 ^ [(NSString *)self->_tvSeasonGenre hash];
  NSUInteger v49 = v40 ^ v48 ^ [(NSString *)self->_movieName hash];
  NSUInteger v50 = [(NSString *)self->_movieGenre hash];
  NSUInteger v51 = v50 ^ [(NSString *)self->_tvShowName hash];
  NSUInteger v52 = v51 ^ [(NSString *)self->_movieBundleName hash];
  NSUInteger v53 = v52 ^ [(NSString *)self->_movieBundleGenre hash];
  NSUInteger v54 = v53 ^ [(NSString *)self->_appleTvTitle hash];
  NSUInteger v55 = v49 ^ v54 ^ [(NSString *)self->_appleTvSubtitle hash];

  return v55;
}

- (INMessageLinkMetadata)initWithSiteName:(id)a3 summary:(id)a4 title:(id)a5 openGraphType:(id)a6 itemType:(id)a7 linkURL:(id)a8 originalURL:(id)a9 imageURLs:(id)a10 iconURLs:(id)a11 creator:(id)a12 linkMediaType:(int64_t)a13 iTunesStoreIdentifier:(id)a14 iTunesStoreFrontIdentifier:(id)a15 songTitle:(id)a16 songArtist:(id)a17 songAlbum:(id)a18 albumName:(id)a19 albumArtist:(id)a20 musicVideoName:(id)a21 musicVideoArtist:(id)a22 artistName:(id)a23 artistGenre:(id)a24 playlistName:(id)a25 playlistCurator:(id)a26 radioName:(id)a27 radioCurator:(id)a28 softwareName:(id)a29 softwareGenre:(id)a30 softwarePlatform:(id)a31 bookName:(id)a32 bookAuthor:(id)a33 audioBookName:(id)a34 audioBookAuthor:(id)a35 audioBookNarrator:(id)a36 podcastName:(id)a37 podcastArtist:(id)a38 podcastEpisodeName:(id)a39 podcastEpisodePodcastName:(id)a40 podcastEpisodeArtist:(id)a41 podcastEpisodeReleaseDate:(id)a42 tvEpisodeEpisodeName:(id)a43 tvEpisodeSeasonName:(id)a44 tvEpisodeGenre:(id)a45 tvSeasonName:(id)a46 tvSeasonGenre:(id)a47 movieName:(id)a48 movieGenre:(id)a49 tvShowName:(id)a50 movieBundleName:(id)a51 movieBundleGenre:(id)a52 appleTvTitle:(id)a53 appleTvSubtitle:(id)a54
{
  id v204 = a3;
  id v205 = a4;
  id v214 = a5;
  id v213 = a6;
  id v212 = a7;
  id v210 = a8;
  id v209 = a9;
  id v208 = a10;
  id v207 = a11;
  id v206 = a12;
  id v58 = a14;
  id v59 = a15;
  id v60 = a16;
  id v61 = a17;
  id v62 = a18;
  id v63 = a19;
  id v64 = a20;
  id v65 = a21;
  id v66 = a22;
  id v203 = a23;
  id v202 = a24;
  id v201 = a25;
  id v200 = a26;
  id v199 = a27;
  id v198 = a28;
  id v197 = a29;
  id v196 = a30;
  id v195 = a31;
  id v194 = a32;
  id v193 = a33;
  id v192 = a34;
  id v191 = a35;
  id v190 = a36;
  id v189 = a37;
  id v188 = a38;
  id v187 = a39;
  id v186 = a40;
  id v185 = a41;
  id v184 = a42;
  id v183 = a43;
  id v182 = a44;
  id v181 = a45;
  id v180 = a46;
  id v179 = a47;
  id v178 = a48;
  id v177 = a49;
  id v176 = a50;
  id v175 = a51;
  id v174 = a52;
  id v173 = a53;
  id v172 = a54;
  v215.receiver = self;
  v215.super_class = (Class)INMessageLinkMetadata;
  v67 = [(INMessageLinkMetadata *)&v215 init];
  if (v67)
  {
    uint64_t v68 = [v204 copy];
    uint64_t siteName = v67->_siteName;
    v67->_uint64_t siteName = (NSString *)v68;

    uint64_t v70 = [v205 copy];
    uint64_t summary = v67->_summary;
    v67->_uint64_t summary = (NSString *)v70;

    uint64_t v72 = [v214 copy];
    uint64_t title = v67->_title;
    v67->_uint64_t title = (NSString *)v72;

    uint64_t v74 = [v213 copy];
    uint64_t openGraphType = v67->_openGraphType;
    v67->_uint64_t openGraphType = (NSString *)v74;

    uint64_t v76 = [v212 copy];
    uint64_t itemType = v67->_itemType;
    v67->_uint64_t itemType = (NSString *)v76;

    uint64_t v78 = [v210 copy];
    uint64_t linkURL = v67->_linkURL;
    v67->_uint64_t linkURL = (NSURL *)v78;

    uint64_t v80 = [v209 copy];
    uint64_t originalURL = v67->_originalURL;
    v67->_uint64_t originalURL = (NSString *)v80;

    uint64_t v82 = [v208 copy];
    uint64_t imageURLs = v67->_imageURLs;
    v67->_uint64_t imageURLs = (NSArray *)v82;

    uint64_t v84 = [v207 copy];
    uint64_t iconURLs = v67->_iconURLs;
    v67->_uint64_t iconURLs = (NSArray *)v84;

    uint64_t v86 = [v206 copy];
    uint64_t creator = v67->_creator;
    v67->_uint64_t creator = (NSString *)v86;

    v67->_linkMediaType = a13;
    uint64_t v88 = [v58 copy];
    uint64_t iTunesStoreIdentifier = v67->_iTunesStoreIdentifier;
    v67->_uint64_t iTunesStoreIdentifier = (NSString *)v88;

    uint64_t v90 = [v59 copy];
    uint64_t iTunesStoreFrontIdentifier = v67->_iTunesStoreFrontIdentifier;
    v67->_uint64_t iTunesStoreFrontIdentifier = (NSString *)v90;

    uint64_t v92 = [v60 copy];
    uint64_t songTitle = v67->_songTitle;
    v67->_uint64_t songTitle = (NSString *)v92;

    uint64_t v94 = [v61 copy];
    uint64_t songArtist = v67->_songArtist;
    v67->_uint64_t songArtist = (NSString *)v94;

    uint64_t v96 = [v62 copy];
    uint64_t songAlbum = v67->_songAlbum;
    v67->_uint64_t songAlbum = (NSString *)v96;

    uint64_t v98 = [v63 copy];
    uint64_t albumName = v67->_albumName;
    v67->_uint64_t albumName = (NSString *)v98;

    uint64_t v100 = [v64 copy];
    uint64_t albumArtist = v67->_albumArtist;
    v67->_uint64_t albumArtist = (NSString *)v100;

    uint64_t v102 = [v65 copy];
    uint64_t musicVideoName = v67->_musicVideoName;
    v67->_uint64_t musicVideoName = (NSString *)v102;

    uint64_t v104 = [v66 copy];
    uint64_t musicVideoArtist = v67->_musicVideoArtist;
    v67->_uint64_t musicVideoArtist = (NSString *)v104;

    uint64_t v106 = [v203 copy];
    uint64_t artistName = v67->_artistName;
    v67->_uint64_t artistName = (NSString *)v106;

    uint64_t v108 = [v202 copy];
    uint64_t artistGenre = v67->_artistGenre;
    v67->_uint64_t artistGenre = (NSString *)v108;

    uint64_t v110 = [v201 copy];
    uint64_t playlistName = v67->_playlistName;
    v67->_uint64_t playlistName = (NSString *)v110;

    uint64_t v112 = [v200 copy];
    uint64_t playlistCurator = v67->_playlistCurator;
    v67->_uint64_t playlistCurator = (NSString *)v112;

    uint64_t v114 = [v199 copy];
    uint64_t radioName = v67->_radioName;
    v67->_uint64_t radioName = (NSString *)v114;

    uint64_t v116 = [v198 copy];
    uint64_t radioCurator = v67->_radioCurator;
    v67->_uint64_t radioCurator = (NSString *)v116;

    uint64_t v118 = [v197 copy];
    uint64_t softwareName = v67->_softwareName;
    v67->_uint64_t softwareName = (NSString *)v118;

    uint64_t v120 = [v196 copy];
    uint64_t softwareGenre = v67->_softwareGenre;
    v67->_uint64_t softwareGenre = (NSString *)v120;

    uint64_t v122 = [v195 copy];
    uint64_t softwarePlatform = v67->_softwarePlatform;
    v67->_uint64_t softwarePlatform = (NSString *)v122;

    uint64_t v124 = [v194 copy];
    uint64_t bookName = v67->_bookName;
    v67->_uint64_t bookName = (NSString *)v124;

    uint64_t v126 = [v193 copy];
    uint64_t bookAuthor = v67->_bookAuthor;
    v67->_uint64_t bookAuthor = (NSString *)v126;

    uint64_t v128 = [v192 copy];
    uint64_t audioBookName = v67->_audioBookName;
    v67->_uint64_t audioBookName = (NSString *)v128;

    uint64_t v130 = [v191 copy];
    uint64_t audioBookAuthor = v67->_audioBookAuthor;
    v67->_uint64_t audioBookAuthor = (NSString *)v130;

    uint64_t v132 = [v190 copy];
    uint64_t audioBookNarrator = v67->_audioBookNarrator;
    v67->_uint64_t audioBookNarrator = (NSString *)v132;

    uint64_t v134 = [v189 copy];
    uint64_t podcastName = v67->_podcastName;
    v67->_uint64_t podcastName = (NSString *)v134;

    uint64_t v136 = [v188 copy];
    uint64_t podcastArtist = v67->_podcastArtist;
    v67->_uint64_t podcastArtist = (NSString *)v136;

    uint64_t v138 = [v187 copy];
    uint64_t podcastEpisodeName = v67->_podcastEpisodeName;
    v67->_uint64_t podcastEpisodeName = (NSString *)v138;

    uint64_t v140 = [v186 copy];
    uint64_t podcastEpisodePodcastName = v67->_podcastEpisodePodcastName;
    v67->_uint64_t podcastEpisodePodcastName = (NSString *)v140;

    uint64_t v142 = [v185 copy];
    uint64_t podcastEpisodeArtist = v67->_podcastEpisodeArtist;
    v67->_uint64_t podcastEpisodeArtist = (NSString *)v142;

    uint64_t v144 = [v184 copy];
    uint64_t podcastEpisodeReleaseDate = v67->_podcastEpisodeReleaseDate;
    v67->_uint64_t podcastEpisodeReleaseDate = (NSDateComponents *)v144;

    uint64_t v146 = [v183 copy];
    uint64_t tvEpisodeEpisodeName = v67->_tvEpisodeEpisodeName;
    v67->_uint64_t tvEpisodeEpisodeName = (NSString *)v146;

    uint64_t v148 = [v182 copy];
    uint64_t tvEpisodeSeasonName = v67->_tvEpisodeSeasonName;
    v67->_uint64_t tvEpisodeSeasonName = (NSString *)v148;

    uint64_t v150 = [v181 copy];
    uint64_t tvEpisodeGenre = v67->_tvEpisodeGenre;
    v67->_uint64_t tvEpisodeGenre = (NSString *)v150;

    uint64_t v152 = [v180 copy];
    uint64_t tvSeasonName = v67->_tvSeasonName;
    v67->_uint64_t tvSeasonName = (NSString *)v152;

    uint64_t v154 = [v179 copy];
    uint64_t tvSeasonGenre = v67->_tvSeasonGenre;
    v67->_uint64_t tvSeasonGenre = (NSString *)v154;

    uint64_t v156 = [v178 copy];
    uint64_t movieName = v67->_movieName;
    v67->_uint64_t movieName = (NSString *)v156;

    uint64_t v158 = [v177 copy];
    movieGenre = v67->_movieGenre;
    v67->_movieGenre = (NSString *)v158;

    uint64_t v160 = [v176 copy];
    tvShowName = v67->_tvShowName;
    v67->_tvShowName = (NSString *)v160;

    uint64_t v162 = [v175 copy];
    movieBundleName = v67->_movieBundleName;
    v67->_movieBundleName = (NSString *)v162;

    uint64_t v164 = [v174 copy];
    movieBundleGenre = v67->_movieBundleGenre;
    v67->_movieBundleGenre = (NSString *)v164;

    uint64_t v166 = [v173 copy];
    appleTvTitle = v67->_appleTvTitle;
    v67->_appleTvTitle = (NSString *)v166;

    uint64_t v168 = [v172 copy];
    appleTvSubuint64_t title = v67->_appleTvSubtitle;
    v67->_appleTvSubuint64_t title = (NSString *)v168;
  }
  return v67;
}

- (INMessageLinkMetadata)initWithSiteName:(NSString *)siteName summary:(NSString *)summary title:(NSString *)title openGraphType:(NSString *)openGraphType linkURL:(NSURL *)linkURL
{
  NSUInteger v12 = siteName;
  v13 = summary;
  uint64_t v14 = title;
  NSUInteger v15 = openGraphType;
  NSUInteger v16 = linkURL;
  v29.receiver = self;
  v29.super_class = (Class)INMessageLinkMetadata;
  NSUInteger v17 = [(INMessageLinkMetadata *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [(NSString *)v12 copy];
    NSUInteger v19 = v17->_siteName;
    v17->_uint64_t siteName = (NSString *)v18;

    uint64_t v20 = [(NSString *)v13 copy];
    NSUInteger v21 = v17->_summary;
    v17->_uint64_t summary = (NSString *)v20;

    uint64_t v22 = [(NSString *)v14 copy];
    NSUInteger v23 = v17->_title;
    v17->_uint64_t title = (NSString *)v22;

    uint64_t v24 = [(NSString *)v15 copy];
    NSUInteger v25 = v17->_openGraphType;
    v17->_uint64_t openGraphType = (NSString *)v24;

    uint64_t v26 = [(NSURL *)v16 copy];
    NSUInteger v27 = v17->_linkURL;
    v17->_uint64_t linkURL = (NSURL *)v26;
  }
  return v17;
}

- (INMessageLinkMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)INMessageLinkMetadata;
  return [(INMessageLinkMetadata *)&v3 init];
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v69 = [v8 objectForKeyedSubscript:@"siteName"];
    uint64_t v68 = [v8 objectForKeyedSubscript:@"summary"];
    v67 = [v8 objectForKeyedSubscript:@"title"];
    id v66 = [v8 objectForKeyedSubscript:@"openGraphType"];
    id v65 = [v8 objectForKeyedSubscript:@"itemType"];
    uint64_t v9 = objc_opt_class();
    [v8 objectForKeyedSubscript:@"linkURL"];
    v10 = objc_super v29 = (objc_class *)a1;
    id v64 = [v7 decodeObjectOfClass:v9 from:v10];

    id v63 = [v8 objectForKeyedSubscript:@"originalURL"];
    id v62 = [v8 objectForKeyedSubscript:@"imageURLs"];
    id v61 = [v8 objectForKeyedSubscript:@"iconURLs"];
    id v60 = [v8 objectForKeyedSubscript:@"creator"];
    uint64_t v11 = [v8 objectForKeyedSubscript:@"linkMediaType"];
    uint64_t v28 = INMessageLinkMediaTypeWithString(v11);

    id v59 = [v8 objectForKeyedSubscript:@"iTunesStoreIdentifier"];
    id v58 = [v8 objectForKeyedSubscript:@"iTunesStoreFrontIdentifier"];
    BOOL v57 = [v8 objectForKeyedSubscript:@"songTitle"];
    uint64_t v56 = [v8 objectForKeyedSubscript:@"songArtist"];
    NSUInteger v55 = [v8 objectForKeyedSubscript:@"songAlbum"];
    NSUInteger v54 = [v8 objectForKeyedSubscript:@"albumName"];
    NSUInteger v53 = [v8 objectForKeyedSubscript:@"albumArtist"];
    NSUInteger v52 = [v8 objectForKeyedSubscript:@"musicVideoName"];
    NSUInteger v51 = [v8 objectForKeyedSubscript:@"musicVideoArtist"];
    NSUInteger v50 = [v8 objectForKeyedSubscript:@"artistName"];
    NSUInteger v49 = [v8 objectForKeyedSubscript:@"artistGenre"];
    NSUInteger v48 = [v8 objectForKeyedSubscript:@"playlistName"];
    NSUInteger v47 = [v8 objectForKeyedSubscript:@"playlistCurator"];
    NSUInteger v44 = [v8 objectForKeyedSubscript:@"radioName"];
    NSUInteger v46 = [v8 objectForKeyedSubscript:@"radioCurator"];
    uint64_t v43 = [v8 objectForKeyedSubscript:@"softwareName"];
    NSUInteger v45 = [v8 objectForKeyedSubscript:@"softwareGenre"];
    NSUInteger v40 = [v8 objectForKeyedSubscript:@"softwarePlatform"];
    NSUInteger v42 = [v8 objectForKeyedSubscript:@"bookName"];
    NSUInteger v39 = [v8 objectForKeyedSubscript:@"bookAuthor"];
    NSUInteger v38 = [v8 objectForKeyedSubscript:@"audioBookName"];
    NSUInteger v41 = [v8 objectForKeyedSubscript:@"audioBookAuthor"];
    NSUInteger v37 = [v8 objectForKeyedSubscript:@"audioBookNarrator"];
    NSUInteger v27 = [v8 objectForKeyedSubscript:@"podcastName"];
    NSUInteger v36 = [v8 objectForKeyedSubscript:@"podcastArtist"];
    uint64_t v26 = [v8 objectForKeyedSubscript:@"podcastEpisodeName"];
    NSUInteger v25 = [v8 objectForKeyedSubscript:@"podcastEpisodePodcastName"];
    NSUInteger v35 = [v8 objectForKeyedSubscript:@"podcastEpisodeArtist"];
    uint64_t v12 = objc_opt_class();
    v13 = [v8 objectForKeyedSubscript:@"podcastEpisodeReleaseDate"];
    NSUInteger v34 = [v7 decodeObjectOfClass:v12 from:v13];

    NSUInteger v33 = [v8 objectForKeyedSubscript:@"tvEpisodeEpisodeName"];
    NSUInteger v32 = [v8 objectForKeyedSubscript:@"tvEpisodeSeasonName"];
    NSUInteger v31 = [v8 objectForKeyedSubscript:@"tvEpisodeGenre"];
    uint64_t v14 = [v8 objectForKeyedSubscript:@"tvSeasonName"];
    uint64_t v24 = [v8 objectForKeyedSubscript:@"tvSeasonGenre"];
    NSUInteger v15 = [v8 objectForKeyedSubscript:@"movieName"];
    NSUInteger v23 = [v8 objectForKeyedSubscript:@"movieGenre"];
    NSUInteger v16 = [v8 objectForKeyedSubscript:@"tvShowName"];
    uint64_t v22 = [v8 objectForKeyedSubscript:@"movieBundleName"];
    [v8 objectForKeyedSubscript:@"movieBundleGenre"];
    NSUInteger v21 = v30 = v7;
    NSUInteger v17 = [v8 objectForKeyedSubscript:@"appleTvTitle"];
    uint64_t v18 = [v8 objectForKeyedSubscript:@"appleTvSubtitle"];
    NSUInteger v19 = objc_msgSend([v29 alloc], "initWithSiteName:summary:title:openGraphType:itemType:linkURL:originalURL:imageURLs:iconURLs:creator:linkMediaType:iTunesStoreIdentifier:iTunesStoreFrontIdentifier:songTitle:songArtist:songAlbum:albumName:albumArtist:musicVideoName:musicVideoArtist:artistName:artistGenre:playlistName:playlistCurator:radioName:radioCurator:softwareName:softwareGenre:softwarePlatform:bookName:bookAuthor:audioBookName:audioBookAuthor:audioBookNarrator:podcastName:podcastArtist:podcastEpisodeName:podcastEpisodePodcastName:podcastEpisodeArtist:podcastEpisodeReleaseDate:tvEpisodeEpisodeName:tvEpisodeSeasonName:tvEpisodeGenre:tvSeasonName:tvSeasonGenre:movieName:movieGenre:tvShowName:movieBundleName:movieBundleGenre:appleTvTitle:appleTvSubtitle:", v69, v68, v67, v66, v65, v64, v63, v62, v61, v60,
                    v28,
                    v59,
                    v58,
                    v57,
                    v56,
                    v55,
                    v54,
                    v53,
                    v52,
                    v51,
                    v50,
                    v49,
                    v48,
                    v47,
                    v44,
                    v46,
                    v43,
                    v45,
                    v40,
                    v42,
                    v39,
                    v38,
                    v41,
                    v37,
                    v27,
                    v36,
                    v26,
                    v25,
                    v35,
                    v34,
                    v33,
                    v32,
                    v31,
                    v14,
                    v24,
                    v15,
                    v23,
                    v16,
                    v22,
                    v21,
                    v17,
                    v18);

    id v7 = v30;
  }
  else
  {
    NSUInteger v19 = 0;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end