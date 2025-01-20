@interface _CPResultSectionForFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)isInitiallyHidden;
- (BOOL)readFrom:(id)a3;
- (NSArray)results;
- (NSData)fallbackResultSection;
- (NSString)bundleIdentifier;
- (NSString)identifier;
- (_CPButtonForFeedback)titleButtonItem;
- (_CPResultSectionForFeedback)initWithFacade:(id)a3;
- (double)rankingScore;
- (id)resultsAtIndex:(unint64_t)a3;
- (int)knownBundleIdentifier;
- (unint64_t)hash;
- (unint64_t)resultsCount;
- (unint64_t)whichBundleid;
- (unsigned)totalAvailableResults;
- (void)addResults:(id)a3;
- (void)clearBundleid;
- (void)clearResults;
- (void)setBundleIdentifier:(id)a3;
- (void)setFallbackResultSection:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsInitiallyHidden:(BOOL)a3;
- (void)setKnownBundleIdentifier:(int)a3;
- (void)setRankingScore:(double)a3;
- (void)setResults:(id)a3;
- (void)setTitleButtonItem:(id)a3;
- (void)setTotalAvailableResults:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPResultSectionForFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleButtonItem, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_fallbackResultSection, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_results, 0);
}

- (unint64_t)whichBundleid
{
  return self->_whichBundleid;
}

- (void)setTitleButtonItem:(id)a3
{
}

- (_CPButtonForFeedback)titleButtonItem
{
  return self->_titleButtonItem;
}

- (void)setTotalAvailableResults:(unsigned int)a3
{
  self->_totalAvailableResults = a3;
}

- (unsigned)totalAvailableResults
{
  return self->_totalAvailableResults;
}

- (void)setIsInitiallyHidden:(BOOL)a3
{
  self->_isInitiallyHidden = a3;
}

- (BOOL)isInitiallyHidden
{
  return self->_isInitiallyHidden;
}

- (void)setFallbackResultSection:(id)a3
{
}

- (NSData)fallbackResultSection
{
  return self->_fallbackResultSection;
}

- (void)setRankingScore:(double)a3
{
  self->_rankingScore = a3;
}

- (double)rankingScore
{
  return self->_rankingScore;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)results
{
  return self->_results;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_results hash];
  NSUInteger v4 = [(NSString *)self->_identifier hash];
  double rankingScore = self->_rankingScore;
  NSUInteger v6 = v4 ^ v3;
  double v7 = -rankingScore;
  if (rankingScore >= 0.0) {
    double v7 = self->_rankingScore;
  }
  long double v8 = round(v7);
  unint64_t v9 = (unint64_t)(fmod(v8, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v7 - v8, 0x40uLL);
  uint64_t v10 = [(NSData *)self->_fallbackResultSection hash];
  NSUInteger v11 = [(NSString *)self->_bundleIdentifier hash];
  uint64_t v12 = 2654435761 * self->_knownBundleIdentifier;
  uint64_t v13 = 2654435761 * self->_isInitiallyHidden;
  uint64_t v14 = 2654435761 * self->_totalAvailableResults;
  return v6 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ [(_CPButtonForFeedback *)self->_titleButtonItem hash] ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  v5 = [(_CPResultSectionForFeedback *)self results];
  NSUInteger v6 = [v4 results];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v7 = [(_CPResultSectionForFeedback *)self results];
  if (v7)
  {
    long double v8 = (void *)v7;
    unint64_t v9 = [(_CPResultSectionForFeedback *)self results];
    uint64_t v10 = [v4 results];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  v5 = [(_CPResultSectionForFeedback *)self identifier];
  NSUInteger v6 = [v4 identifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v12 = [(_CPResultSectionForFeedback *)self identifier];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_CPResultSectionForFeedback *)self identifier];
    v15 = [v4 identifier];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  double rankingScore = self->_rankingScore;
  [v4 rankingScore];
  if (rankingScore != v18) {
    goto LABEL_31;
  }
  v5 = [(_CPResultSectionForFeedback *)self fallbackResultSection];
  NSUInteger v6 = [v4 fallbackResultSection];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v19 = [(_CPResultSectionForFeedback *)self fallbackResultSection];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_CPResultSectionForFeedback *)self fallbackResultSection];
    v22 = [v4 fallbackResultSection];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  v5 = [(_CPResultSectionForFeedback *)self bundleIdentifier];
  NSUInteger v6 = [v4 bundleIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v24 = [(_CPResultSectionForFeedback *)self bundleIdentifier];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(_CPResultSectionForFeedback *)self bundleIdentifier];
    v27 = [v4 bundleIdentifier];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  int knownBundleIdentifier = self->_knownBundleIdentifier;
  if (knownBundleIdentifier != [v4 knownBundleIdentifier]) {
    goto LABEL_31;
  }
  int isInitiallyHidden = self->_isInitiallyHidden;
  if (isInitiallyHidden != [v4 isInitiallyHidden]) {
    goto LABEL_31;
  }
  unsigned int totalAvailableResults = self->_totalAvailableResults;
  if (totalAvailableResults != [v4 totalAvailableResults]) {
    goto LABEL_31;
  }
  v5 = [(_CPResultSectionForFeedback *)self titleButtonItem];
  NSUInteger v6 = [v4 titleButtonItem];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_30:

    goto LABEL_31;
  }
  uint64_t v32 = [(_CPResultSectionForFeedback *)self titleButtonItem];
  if (!v32)
  {

LABEL_34:
    BOOL v37 = 1;
    goto LABEL_32;
  }
  v33 = (void *)v32;
  v34 = [(_CPResultSectionForFeedback *)self titleButtonItem];
  v35 = [v4 titleButtonItem];
  char v36 = [v34 isEqual:v35];

  if (v36) {
    goto LABEL_34;
  }
LABEL_31:
  BOOL v37 = 0;
LABEL_32:

  return v37;
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = self->_results;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(_CPResultSectionForFeedback *)self identifier];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  [(_CPResultSectionForFeedback *)self rankingScore];
  if (v11 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
  uint64_t v12 = [(_CPResultSectionForFeedback *)self fallbackResultSection];

  if (v12) {
    PBDataWriterWriteDataField();
  }
  uint64_t v13 = [(_CPResultSectionForFeedback *)self bundleIdentifier];

  if (v13) {
    PBDataWriterWriteStringField();
  }
  if ([(_CPResultSectionForFeedback *)self knownBundleIdentifier]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPResultSectionForFeedback *)self isInitiallyHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPResultSectionForFeedback *)self totalAvailableResults]) {
    PBDataWriterWriteUint32Field();
  }
  uint64_t v14 = [(_CPResultSectionForFeedback *)self titleButtonItem];

  if (v14)
  {
    v15 = [(_CPResultSectionForFeedback *)self titleButtonItem];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPResultSectionForFeedbackReadFrom(self, (uint64_t)a3);
}

- (int)knownBundleIdentifier
{
  if (self->_whichBundleid == 2) {
    return self->_knownBundleIdentifier;
  }
  else {
    return 0;
  }
}

- (void)setKnownBundleIdentifier:(int)a3
{
  self->_whichBundleid = 2;
  self->_int knownBundleIdentifier = a3;
}

- (NSString)bundleIdentifier
{
  if (self->_whichBundleid == 1) {
    v2 = self->_bundleIdentifier;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)setBundleIdentifier:(id)a3
{
  id v6 = a3;
  [(_CPResultSectionForFeedback *)self clearBundleid];
  self->_whichBundleid = v6 != 0;
  id v4 = (NSString *)[v6 copy];
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v4;
}

- (id)resultsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_results objectAtIndexedSubscript:a3];
}

- (unint64_t)resultsCount
{
  return [(NSArray *)self->_results count];
}

- (void)addResults:(id)a3
{
  id v4 = a3;
  results = self->_results;
  id v8 = v4;
  if (!results)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_results;
    self->_results = v6;

    id v4 = v8;
    results = self->_results;
  }
  [(NSArray *)results addObject:v4];
}

- (void)clearResults
{
}

- (void)setResults:(id)a3
{
  self->_results = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (void)clearBundleid
{
  self->_whichBundleid = 0;
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = 0;

  self->_int knownBundleIdentifier = 0;
}

- (_CPResultSectionForFeedback)initWithFacade:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_CPResultSectionForFeedback;
  v5 = [(_CPResultSectionForFeedback *)&v31 init];
  if (!v5) {
    goto LABEL_378;
  }
  id v6 = [v4 results];
  if (v6) {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v7 = 0;
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = objc_msgSend(v4, "results", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [[_CPSearchResultForFeedback alloc] initWithFacade:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }

  [(_CPResultSectionForFeedback *)v5 setResults:v7];
  uint64_t v14 = [v4 identifier];

  if (v14)
  {
    v15 = [v4 identifier];
    [(_CPResultSectionForFeedback *)v5 setIdentifier:v15];
  }
  [v4 rankingScore];
  -[_CPResultSectionForFeedback setRankingScore:](v5, "setRankingScore:");
  long long v16 = [v4 bundleIdentifier];

  if (v16)
  {
    id v17 = [v4 bundleIdentifier];
    if ([v17 compare:@"unknown" options:3])
    {
      if ([v17 compare:@"com.apple.parsec.web_index" options:3])
      {
        if ([v17 compare:@"com.apple.application" options:3])
        {
          uint64_t v18 = 3;
          if ([v17 compare:@"com.apple.preferences" options:3])
          {
            if ([v17 compare:@"com.apple.mobilemail" options:3])
            {
              if ([v17 compare:@"com.apple.mobilesafari" options:3])
              {
                if ([v17 compare:@"com.apple.mobilesms" options:3])
                {
                  if ([v17 compare:@"com.apple.stocks" options:3])
                  {
                    if ([v17 compare:@"com.apple.parsec.stocks" options:3])
                    {
                      if ([v17 compare:@"com.apple.taptoradar" options:3])
                      {
                        if ([v17 compare:@"com.apple.searchd.zkw.apps" options:3])
                        {
                          if ([v17 compare:@"com.apple.searchd.suggestions" options:3])
                          {
                            if ([v17 compare:@"com.apple.podcasts" options:3])
                            {
                              if ([v17 compare:@"com.apple.mobileaddressbook" options:3])
                              {
                                if ([v17 compare:@"com.apple.documentsapp" options:3])
                                {
                                  if ([v17 compare:@"com.apple.coresuggestions" options:3])
                                  {
                                    if ([v17 compare:@"com.apple.clouddocs.mobiledocumentsfileprovider" options:3])
                                    {
                                      if ([v17 compare:@"com.apple.music" options:3])
                                      {
                                        if ([v17 compare:@"com.apple.mobilecal" options:3])
                                        {
                                          if ([v17 compare:@"com.apple.other:search_web" options:3])
                                          {
                                            if ([v17 compare:@"com.apple.other:search_app_store" options:3])
                                            {
                                              if ([v17 compare:@"com.apple.other:search_maps" options:3])
                                              {
                                                if ([v17 compare:@"com.apple.spotlight.suggestionlist.usertypedstring" options:3])
                                                {
                                                  if ([v17 compare:@"com.apple.spotlight.suggestionlist.parsec" options:3])
                                                  {
                                                    if ([v17 compare:@"com.apple.other:taptoradar" options:3])
                                                    {
                                                      if ([v17 compare:@"com.apple.spotlightui.search-through" options:3])
                                                      {
                                                        if ([v17 compare:@"com.apple.weather" options:3])
                                                        {
                                                          if ([v17 compare:@"com.apple.maps" options:3])
                                                          {
                                                            if ([v17 compare:@"google_comp" options:3])
                                                            {
                                                              if ([v17 compare:@"history" options:3])
                                                              {
                                                                if ([v17 compare:@"com.apple.safari.completionlist.searchenginesuggestion" options:3])
                                                                {
                                                                  if ([v17 compare:@"google_search" options:3])
                                                                  {
                                                                    if ([v17 compare:@"com.apple.safari.completionlist.usertypedstring" options:3])
                                                                    {
                                                                      if ([v17 compare:@"com.apple.history" options:3])
                                                                      {
                                                                        if ([v17 compare:@"com.apple.safari.completionlist.findonpage" options:3])
                                                                        {
                                                                          if ([v17 compare:@"tophit" options:3])
                                                                          {
                                                                            if ([v17 compare:@"com.apple.tophit" options:3])
                                                                            {
                                                                              if ([v17 compare:@"icloud_tab" options:3])
                                                                              {
                                                                                if ([v17 compare:@"com.apple.safari.completionlist.recentsearch" options:3])
                                                                                {
                                                                                  if ([v17 compare:@"bookmark" options:3])
                                                                                  {
                                                                                    if ([v17 compare:@"yahoo_comp" options:3])
                                                                                    {
                                                                                      if ([v17 compare:@"com.apple.bookmarks" options:3])
                                                                                      {
                                                                                        if ([v17 compare:@"com.apple.other" options:3])
                                                                                        {
                                                                                          if ([v17 compare:@"bing_comp" options:3])
                                                                                          {
                                                                                            if ([v17 compare:@"com.apple.hashtagimages.querysuggestions.suggestion" options:3])
                                                                                            {
                                                                                              if ([v17 compare:@"com.apple.safari.completionlist.restoredsearchcompletion" options:3])
                                                                                              {
                                                                                                if ([v17 compare:@"ddg_comp" options:3])
                                                                                                {
                                                                                                  if ([v17 compare:@"yahoo_search" options:3])
                                                                                                  {
                                                                                                    if ([v17 compare:@"com.atebits.tweetie2" options:3])
                                                                                                    {
                                                                                                      if ([v17 compare:@"address_box" options:3])
                                                                                                      {
                                                                                                        if ([v17 compare:@"com.apple.spotlight.suggestionlist.local" options:3])
                                                                                                        {
                                                                                                          if ([v17 compare:@"ddg_search" options:3])
                                                                                                          {
                                                                                                            if ([v17 compare:@"bing_search" options:3])
                                                                                                            {
                                                                                                              if ([v17 compare:@"com.apple.news" options:3])
                                                                                                              {
                                                                                                                if ([v17 compare:@"com.apple.coresuggestions" options:3])
                                                                                                                {
                                                                                                                  if ([v17 compare:@"com.giphy.giphyformessenger" options:3])
                                                                                                                  {
                                                                                                                    if ([v17 compare:@"com.apple.settings" options:3])
                                                                                                                    {
                                                                                                                      if ([v17 compare:@"com.google.ios.youtube" options:3])
                                                                                                                      {
                                                                                                                        if ([v17 compare:@"net.whatsapp.whatsapp" options:3])
                                                                                                                        {
                                                                                                                          if ([v17 compare:@"com.apple.applications" options:3])
                                                                                                                          {
                                                                                                                            if ([v17 compare:@"com.riffsy.riffsykeyboard" options:3])
                                                                                                                            {
                                                                                                                              if ([v17 compare:@"com.apple.spotlight.suggestionlist.contact" options:3])
                                                                                                                              {
                                                                                                                                if ([v17 compare:@"com.yelp.yelpiphone" options:3])
                                                                                                                                {
                                                                                                                                  if ([v17 compare:@"com.microsoft.office.outlook" options:3])
                                                                                                                                  {
                                                                                                                                    if ([v17 compare:@"pinterest" options:3])
                                                                                                                                    {
                                                                                                                                      if ([v17 compare:@"com.apple.mail" options:3])
                                                                                                                                      {
                                                                                                                                        if ([v17 compare:@"com.apple.hashtagimages.categorylist.categories.category" options:3])
                                                                                                                                        {
                                                                                                                                          if ([v17 compare:@"com.apple.mobilenotes" options:3])
                                                                                                                                          {
                                                                                                                                            if ([v17 compare:@"com.apple.pdfs" options:3])
                                                                                                                                            {
                                                                                                                                              if ([v17 compare:@"com.apple.documents" options:3])
                                                                                                                                              {
                                                                                                                                                if ([v17 compare:@"com.google.chrome.ios" options:3])
                                                                                                                                                {
                                                                                                                                                  if ([v17 compare:@"com.apple.developer" options:3])
                                                                                                                                                  {
                                                                                                                                                    if ([v17 compare:@"com.google.maps" options:3])
                                                                                                                                                    {
                                                                                                                                                      if ([v17 compare:@"com.apple.directories" options:3])
                                                                                                                                                      {
                                                                                                                                                        if ([v17 compare:@"baidu_comp" options:3])
                                                                                                                                                        {
                                                                                                                                                          if ([v17 compare:@"baidu_search" options:3])
                                                                                                                                                          {
                                                                                                                                                            if ([v17 compare:@"com.apple.reminders" options:3])
                                                                                                                                                            {
                                                                                                                                                              if ([v17 compare:@"com.apple.photos" options:3])
                                                                                                                                                              {
                                                                                                                                                                if ([v17 compare:@"com.apple.dictionary" options:3])
                                                                                                                                                                {
                                                                                                                                                                  if ([v17 compare:@"siri_comp" options:3])
                                                                                                                                                                  {
                                                                                                                                                                    if ([v17 compare:@"com.google.photos" options:3])
                                                                                                                                                                    {
                                                                                                                                                                      if ([v17 compare:@"com.apple.ibooks" options:3])
                                                                                                                                                                      {
                                                                                                                                                                        if ([v17 compare:@"com.linkedin.linkedin" options:3])
                                                                                                                                                                        {
                                                                                                                                                                          if ([v17 compare:@"com.apple.numbers" options:3])
                                                                                                                                                                          {
                                                                                                                                                                            if ([v17 compare:@"com.apple.mobiletimer" options:3])
                                                                                                                                                                            {
                                                                                                                                                                              if ([v17 compare:@"com.pandora" options:3])
                                                                                                                                                                              {
                                                                                                                                                                                if ([v17 compare:@"com.apple.hashtagimages.categorylist.recents.recent" options:3])
                                                                                                                                                                                {
                                                                                                                                                                                  if ([v17 compare:@"com.mlb.atbatuniversal" options:3])
                                                                                                                                                                                  {
                                                                                                                                                                                    if ([v17 compare:@"com.yahoo.aerogram" options:3])
                                                                                                                                                                                    {
                                                                                                                                                                                      if ([v17 compare:@"com.getdropbox.dropbox" options:3])
                                                                                                                                                                                      {
                                                                                                                                                                                        if ([v17 compare:@"com.apple.lookup.search-through" options:3])
                                                                                                                                                                                        {
                                                                                                                                                                                          if ([v17 compare:@"com.apple.calendar" options:3])
                                                                                                                                                                                          {
                                                                                                                                                                                            if ([v17 compare:@"com.airbnb.app" options:3])
                                                                                                                                                                                            {
                                                                                                                                                                                              if ([v17 compare:@"com.stubhub.stubhub" options:3])
                                                                                                                                                                                              {
                                                                                                                                                                                                if ([v17 compare:@"com.groupon.grouponapp" options:3])
                                                                                                                                                                                                {
                                                                                                                                                                                                  if ([v17 compare:@"com.apple.calculator" options:3])
                                                                                                                                                                                                  {
                                                                                                                                                                                                    if ([v17 compare:@"tv.twitch" options:3])
                                                                                                                                                                                                    {
                                                                                                                                                                                                      if ([v17 compare:@"com.apple.keynote" options:3])
                                                                                                                                                                                                      {
                                                                                                                                                                                                        if ([v17 compare:@"com.zillow.zillowmap" options:3])
                                                                                                                                                                                                        {
                                                                                                                                                                                                          if ([v17 compare:@"com.apple.voicememos" options:3])
                                                                                                                                                                                                          {
                                                                                                                                                                                                            if ([v17 compare:@"com.apple.safari.completionlist.quickwebsitesearch" options:3])
                                                                                                                                                                                                            {
                                                                                                                                                                                                              if ([v17 compare:@"com.apple.parsec.image_search.msgs-zkw" options:3])
                                                                                                                                                                                                              {
                                                                                                                                                                                                                if ([v17 compare:@"com.apple.safari.completionlist.searchsuggestionprovider" options:3])
                                                                                                                                                                                                                {
                                                                                                                                                                                                                  if ([v17 compare:@"com.apple.searchd.zkw.suggestion" options:3])
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                    if ([v17 compare:@"com.apple.other:search_siri" options:3])
                                                                                                                                                                                                                    {
                                                                                                                                                                                                                      if ([v17 compare:@"switch_to_tab" options:3])
                                                                                                                                                                                                                      {
                                                                                                                                                                                                                        if ([v17 compare:@"com.apple.Safari.CompletionList.WebsiteSpecificSearch" options:3])
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                          if ([v17 compare:@"com.apple.spotlight.suggestionlist.siri" options:3])
                                                                                                                                                                                                                          {
                                                                                                                                                                                                                            if ([v17 compare:@"com.apple.contacts" options:3])
                                                                                                                                                                                                                            {
                                                                                                                                                                                                                              if ([v17 compare:@"com.apple.parsec.itunes.iossoftware" options:3])
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                if ([v17 compare:@"com.apple.parsec.maps" options:3])
                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                  if ([v17 compare:@"com.apple.parsec.wiki" options:3])
                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                    if ([v17 compare:@"com.apple.parsec.kg" options:3])
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                      if ([v17 compare:@"com.apple.parsec.news" options:3])
                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                        if ([v17 compare:@"com.apple.parsec.weather" options:3])
                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                          if ([v17 compare:@"com.apple.searchd.searchthroughsuggestions" options:3])
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                            if ([v17 compare:@"com.apple.spotlight.websuggestionlist.usertypedstring" options:3])
                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                              if ([v17 compare:@"com.apple.spotlight.websuggestionlist.parsec" options:3])
                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                if ([v17 compare:@"com.apple.spotlight.related_search_as_typed.web" options:3])
                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                  if ([v17 compare:@"com.apple.spotlight.tophits" options:3])
                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                    if ([v17 compare:@"com.apple.spotlight.related_search" options:3])
                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                      if ([v17 compare:@"com.apple.mail.search.tophit" options:3])
                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                        if ([v17 compare:@"com.apple.mail.search.suggestion" options:3])
                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                          if ([v17 compare:@"com.apple.mail.search.suggestion.vip" options:3])
                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                            if ([v17 compare:@"com.apple.mail.search.suggestion.usertyped" options:3])
                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                              if ([v17 compare:@"com.apple.mail.search.messageresult" options:3])
                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                if ([v17 compare:@"com.apple.mail.search.messagelist" options:3])
                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                  if ([v17 compare:@"com.apple.parsec.entity" options:3])
                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                    if ([v17 compare:@"com.apple.mail.search.suggestion.date" options:3])
                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                      if ([v17 compare:@"com.apple.mail.search.suggestion.free_text" options:3])
                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                        if ([v17 compare:@"com.apple.mail.search.suggestion.attachment" options:3])
                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                          if ([v17 compare:@"com.apple.mail.search.suggestion.people" options:3])
                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                            if ([v17 compare:@"com.apple.mail.search.suggestion.contact" options:3])
                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                              if ([v17 compare:@"com.apple.mail.search.suggestion.mailbox" options:3])
                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                if ([v17 compare:@"com.apple.mail.search.suggestion.flag" options:3])
                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                  if ([v17 compare:@"com.apple.mail.search.suggestion.subject" options:3])
                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                    if ([v17 compare:@"com.apple.mail.search.location" options:3])
                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                      if ([v17 compare:@"com.apple.mail.search.document" options:3])
                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                        if ([v17 compare:@"com.apple.mail.search.link" options:3])
                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                          if ([v17 compare:@"com.apple.1papplication" options:3])
                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                            if ([v17 compare:@"com.apple.3papplication" options:3])
                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                              if ([v17 compare:@"com.apple.mail.search.suggestion.sendercontains" options:3])
                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                if ([v17 compare:@"com.apple.mail.search.suggestion.topiccontains" options:3])
                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                  if ([v17 compare:@"com.apple.mail.search.suggestion.instantanswer" options:3])
                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                    if ([v17 compare:@"com.apple.photos.Albums" options:3])
                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                      if ([v17 compare:@"com.apple.photos.Caption" options:3])
                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                        if ([v17 compare:@"com.apple.photos.Categories" options:3])
                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                          if ([v17 compare:@"com.apple.photos.Dates" options:3])
                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                            if ([v17 compare:@"com.apple.photos.ImportedByApp" options:3])
                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                              if ([v17 compare:@"com.apple.photos.Keywords" options:3])
                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                if ([v17 compare:@"com.apple.photos.MediaType" options:3])
                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                  if ([v17 compare:@"com.apple.photos.Memories" options:3])
                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                    if ([v17 compare:@"com.apple.photos.Moments" options:3])
                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                      if ([v17 compare:@"com.apple.photos.Ocr" options:3])
                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                        if ([v17 compare:@"com.apple.photos.People" options:3])
                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                          if ([v17 compare:@"com.apple.photos.Places" options:3])
                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                            if ([v17 compare:@"com.apple.photos.Title" options:3])
                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                              if ([v17 compare:@"com.apple.photos.TopResults" options:3])
                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                if ([v17 compare:@"com.apple.photos.suggestions.Generic" options:3])
                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                  if ([v17 compare:@"com.apple.photos.suggestions.Place" options:3])
                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                    if ([v17 compare:@"com.apple.photos.zkw.Date" options:3])
                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                      if ([v17 compare:@"com.apple.photos.zkw.Meaning" options:3])
                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                        if ([v17 compare:@"com.apple.photos.zkw.Person" options:3])
                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                          if ([v17 compare:@"com.apple.photos.zkw.Place" options:3])
                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                            if ([v17 compare:@"com.apple.photos.zkw.Scene" options:3])
                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                              if ([v17 compare:@"com.apple.photos.zkw.Season" options:3])
                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                if ([v17 compare:@"com.apple.photos.zkw.SocialGroup" options:3])
                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                  if ([v17 compare:@"com.apple.photos.zkw.UnnamedPerson" options:3])
                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                    if ([v17 compare:@"com.apple.mail.search.instantanswer.flight" options:3])
                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                      if ([v17 compare:@"com.apple.mail.search.instantanswer.lodging" options:3])
                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                        if ([v17 compare:@"com.apple.photos.Trip" options:3])
                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                          if ([v17 compare:@"com.apple.photos.AllResults" options:3])
                                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                                            if ([v17 compare:@"com.apple.photos.suggestions.UserGeneratedText" options:3])
                                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                                              if ([v17 compare:@"com.apple.photos.suggestions.Scene" options:3])
                                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                                if ([v17 compare:@"com.apple.photos.suggestions.PublicEvent" options:3])
                                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                                  if ([v17 compare:@"com.apple.photos.suggestions.ActionCam" options:3])
                                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                                    if ([v17 compare:@"com.apple.photos.suggestions.Spatial" options:3])
                                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                                      if ([v17 compare:@"com.apple.photos.suggestions.Filename" options:3])
                                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                                        if ([v17 compare:@"com.apple.photos.zkw.prompt" options:3])
                                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                                          if ([v17 compare:@"com.apple.photos.suggestions" options:3]) {
                                                                                                                                                                                                                                                                                                                                                                            goto LABEL_195;
                                                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                                                          uint64_t v18 = 179;
                                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                                          uint64_t v18 = 178;
                                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                                        uint64_t v18 = 177;
                                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                                      uint64_t v18 = 176;
                                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                                    uint64_t v18 = 175;
                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                                  uint64_t v18 = 174;
                                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                                uint64_t v18 = 173;
                                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                                              uint64_t v18 = 172;
                                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                                            uint64_t v18 = 171;
                                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                                          uint64_t v18 = 170;
                                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                                        uint64_t v18 = 169;
                                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                                      uint64_t v18 = 168;
                                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                                    uint64_t v18 = 167;
                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                                  uint64_t v18 = 166;
                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                                uint64_t v18 = 165;
                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                                              uint64_t v18 = 164;
                                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                                            uint64_t v18 = 163;
                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                                          uint64_t v18 = 162;
                                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                                        uint64_t v18 = 161;
                                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                                      uint64_t v18 = 160;
                                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                                    uint64_t v18 = 159;
                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                                  uint64_t v18 = 158;
                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                                uint64_t v18 = 157;
                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                                              uint64_t v18 = 156;
                                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                                            uint64_t v18 = 155;
                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                                          uint64_t v18 = 154;
                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                                        uint64_t v18 = 153;
                                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                                      uint64_t v18 = 152;
                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                                    uint64_t v18 = 151;
                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                                  uint64_t v18 = 150;
                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                                uint64_t v18 = 149;
                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                                              uint64_t v18 = 148;
                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                                            uint64_t v18 = 147;
                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                                          uint64_t v18 = 146;
                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                                        uint64_t v18 = 145;
                                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                                      uint64_t v18 = 144;
                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                                    uint64_t v18 = 143;
                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                                  uint64_t v18 = 142;
                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                                uint64_t v18 = 141;
                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                                              uint64_t v18 = 140;
                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                                            uint64_t v18 = 139;
                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                                          uint64_t v18 = 138;
                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                                        uint64_t v18 = 137;
                                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                                      uint64_t v18 = 136;
                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                                    uint64_t v18 = 135;
                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                                  uint64_t v18 = 134;
                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                                uint64_t v18 = 133;
                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                                              uint64_t v18 = 132;
                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                                            uint64_t v18 = 131;
                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                                          uint64_t v18 = 130;
                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                                        uint64_t v18 = 129;
                                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                                      uint64_t v18 = 128;
                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                                    uint64_t v18 = 127;
                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                                  uint64_t v18 = 126;
                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                                uint64_t v18 = 125;
                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                                              uint64_t v18 = 124;
                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                                            uint64_t v18 = 123;
                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                                          uint64_t v18 = 122;
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                                        uint64_t v18 = 121;
                                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                                      uint64_t v18 = 120;
                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                                    uint64_t v18 = 119;
                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                                  uint64_t v18 = 118;
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                              else
                                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                                uint64_t v18 = 117;
                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                            {
                                                                                                                                                                                                                                              uint64_t v18 = 116;
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                          else
                                                                                                                                                                                                                                          {
                                                                                                                                                                                                                                            uint64_t v18 = 115;
                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                        {
                                                                                                                                                                                                                                          uint64_t v18 = 114;
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                      else
                                                                                                                                                                                                                                      {
                                                                                                                                                                                                                                        uint64_t v18 = 113;
                                                                                                                                                                                                                                      }
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                    {
                                                                                                                                                                                                                                      uint64_t v18 = 112;
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                  else
                                                                                                                                                                                                                                  {
                                                                                                                                                                                                                                    uint64_t v18 = 111;
                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                {
                                                                                                                                                                                                                                  uint64_t v18 = 110;
                                                                                                                                                                                                                                }
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                              else
                                                                                                                                                                                                                              {
                                                                                                                                                                                                                                uint64_t v18 = 109;
                                                                                                                                                                                                                              }
                                                                                                                                                                                                                            }
                                                                                                                                                                                                                            else
                                                                                                                                                                                                                            {
                                                                                                                                                                                                                              uint64_t v18 = 108;
                                                                                                                                                                                                                            }
                                                                                                                                                                                                                          }
                                                                                                                                                                                                                          else
                                                                                                                                                                                                                          {
                                                                                                                                                                                                                            uint64_t v18 = 107;
                                                                                                                                                                                                                          }
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                        else
                                                                                                                                                                                                                        {
                                                                                                                                                                                                                          uint64_t v18 = 106;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                      }
                                                                                                                                                                                                                      else
                                                                                                                                                                                                                      {
                                                                                                                                                                                                                        uint64_t v18 = 105;
                                                                                                                                                                                                                      }
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                    else
                                                                                                                                                                                                                    {
                                                                                                                                                                                                                      uint64_t v18 = 104;
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                  else
                                                                                                                                                                                                                  {
                                                                                                                                                                                                                    uint64_t v18 = 103;
                                                                                                                                                                                                                  }
                                                                                                                                                                                                                }
                                                                                                                                                                                                                else
                                                                                                                                                                                                                {
                                                                                                                                                                                                                  uint64_t v18 = 102;
                                                                                                                                                                                                                }
                                                                                                                                                                                                              }
                                                                                                                                                                                                              else
                                                                                                                                                                                                              {
                                                                                                                                                                                                                uint64_t v18 = 101;
                                                                                                                                                                                                              }
                                                                                                                                                                                                            }
                                                                                                                                                                                                            else
                                                                                                                                                                                                            {
                                                                                                                                                                                                              uint64_t v18 = 100;
                                                                                                                                                                                                            }
                                                                                                                                                                                                          }
                                                                                                                                                                                                          else
                                                                                                                                                                                                          {
                                                                                                                                                                                                            uint64_t v18 = 99;
                                                                                                                                                                                                          }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        else
                                                                                                                                                                                                        {
                                                                                                                                                                                                          uint64_t v18 = 98;
                                                                                                                                                                                                        }
                                                                                                                                                                                                      }
                                                                                                                                                                                                      else
                                                                                                                                                                                                      {
                                                                                                                                                                                                        uint64_t v18 = 97;
                                                                                                                                                                                                      }
                                                                                                                                                                                                    }
                                                                                                                                                                                                    else
                                                                                                                                                                                                    {
                                                                                                                                                                                                      uint64_t v18 = 96;
                                                                                                                                                                                                    }
                                                                                                                                                                                                  }
                                                                                                                                                                                                  else
                                                                                                                                                                                                  {
                                                                                                                                                                                                    uint64_t v18 = 95;
                                                                                                                                                                                                  }
                                                                                                                                                                                                }
                                                                                                                                                                                                else
                                                                                                                                                                                                {
                                                                                                                                                                                                  uint64_t v18 = 94;
                                                                                                                                                                                                }
                                                                                                                                                                                              }
                                                                                                                                                                                              else
                                                                                                                                                                                              {
                                                                                                                                                                                                uint64_t v18 = 93;
                                                                                                                                                                                              }
                                                                                                                                                                                            }
                                                                                                                                                                                            else
                                                                                                                                                                                            {
                                                                                                                                                                                              uint64_t v18 = 92;
                                                                                                                                                                                            }
                                                                                                                                                                                          }
                                                                                                                                                                                          else
                                                                                                                                                                                          {
                                                                                                                                                                                            uint64_t v18 = 91;
                                                                                                                                                                                          }
                                                                                                                                                                                        }
                                                                                                                                                                                        else
                                                                                                                                                                                        {
                                                                                                                                                                                          uint64_t v18 = 90;
                                                                                                                                                                                        }
                                                                                                                                                                                      }
                                                                                                                                                                                      else
                                                                                                                                                                                      {
                                                                                                                                                                                        uint64_t v18 = 89;
                                                                                                                                                                                      }
                                                                                                                                                                                    }
                                                                                                                                                                                    else
                                                                                                                                                                                    {
                                                                                                                                                                                      uint64_t v18 = 88;
                                                                                                                                                                                    }
                                                                                                                                                                                  }
                                                                                                                                                                                  else
                                                                                                                                                                                  {
                                                                                                                                                                                    uint64_t v18 = 87;
                                                                                                                                                                                  }
                                                                                                                                                                                }
                                                                                                                                                                                else
                                                                                                                                                                                {
                                                                                                                                                                                  uint64_t v18 = 86;
                                                                                                                                                                                }
                                                                                                                                                                              }
                                                                                                                                                                              else
                                                                                                                                                                              {
                                                                                                                                                                                uint64_t v18 = 85;
                                                                                                                                                                              }
                                                                                                                                                                            }
                                                                                                                                                                            else
                                                                                                                                                                            {
                                                                                                                                                                              uint64_t v18 = 84;
                                                                                                                                                                            }
                                                                                                                                                                          }
                                                                                                                                                                          else
                                                                                                                                                                          {
                                                                                                                                                                            uint64_t v18 = 83;
                                                                                                                                                                          }
                                                                                                                                                                        }
                                                                                                                                                                        else
                                                                                                                                                                        {
                                                                                                                                                                          uint64_t v18 = 82;
                                                                                                                                                                        }
                                                                                                                                                                      }
                                                                                                                                                                      else
                                                                                                                                                                      {
                                                                                                                                                                        uint64_t v18 = 81;
                                                                                                                                                                      }
                                                                                                                                                                    }
                                                                                                                                                                    else
                                                                                                                                                                    {
                                                                                                                                                                      uint64_t v18 = 80;
                                                                                                                                                                    }
                                                                                                                                                                  }
                                                                                                                                                                  else
                                                                                                                                                                  {
                                                                                                                                                                    uint64_t v18 = 79;
                                                                                                                                                                  }
                                                                                                                                                                }
                                                                                                                                                                else
                                                                                                                                                                {
                                                                                                                                                                  uint64_t v18 = 78;
                                                                                                                                                                }
                                                                                                                                                              }
                                                                                                                                                              else
                                                                                                                                                              {
                                                                                                                                                                uint64_t v18 = 77;
                                                                                                                                                              }
                                                                                                                                                            }
                                                                                                                                                            else
                                                                                                                                                            {
                                                                                                                                                              uint64_t v18 = 76;
                                                                                                                                                            }
                                                                                                                                                          }
                                                                                                                                                          else
                                                                                                                                                          {
                                                                                                                                                            uint64_t v18 = 75;
                                                                                                                                                          }
                                                                                                                                                        }
                                                                                                                                                        else
                                                                                                                                                        {
                                                                                                                                                          uint64_t v18 = 74;
                                                                                                                                                        }
                                                                                                                                                      }
                                                                                                                                                      else
                                                                                                                                                      {
                                                                                                                                                        uint64_t v18 = 73;
                                                                                                                                                      }
                                                                                                                                                    }
                                                                                                                                                    else
                                                                                                                                                    {
                                                                                                                                                      uint64_t v18 = 72;
                                                                                                                                                    }
                                                                                                                                                  }
                                                                                                                                                  else
                                                                                                                                                  {
                                                                                                                                                    uint64_t v18 = 71;
                                                                                                                                                  }
                                                                                                                                                }
                                                                                                                                                else
                                                                                                                                                {
                                                                                                                                                  uint64_t v18 = 70;
                                                                                                                                                }
                                                                                                                                              }
                                                                                                                                              else
                                                                                                                                              {
                                                                                                                                                uint64_t v18 = 69;
                                                                                                                                              }
                                                                                                                                            }
                                                                                                                                            else
                                                                                                                                            {
                                                                                                                                              uint64_t v18 = 68;
                                                                                                                                            }
                                                                                                                                          }
                                                                                                                                          else
                                                                                                                                          {
                                                                                                                                            uint64_t v18 = 67;
                                                                                                                                          }
                                                                                                                                        }
                                                                                                                                        else
                                                                                                                                        {
                                                                                                                                          uint64_t v18 = 66;
                                                                                                                                        }
                                                                                                                                      }
                                                                                                                                      else
                                                                                                                                      {
                                                                                                                                        uint64_t v18 = 65;
                                                                                                                                      }
                                                                                                                                    }
                                                                                                                                    else
                                                                                                                                    {
                                                                                                                                      uint64_t v18 = 64;
                                                                                                                                    }
                                                                                                                                  }
                                                                                                                                  else
                                                                                                                                  {
                                                                                                                                    uint64_t v18 = 63;
                                                                                                                                  }
                                                                                                                                }
                                                                                                                                else
                                                                                                                                {
                                                                                                                                  uint64_t v18 = 62;
                                                                                                                                }
                                                                                                                              }
                                                                                                                              else
                                                                                                                              {
                                                                                                                                uint64_t v18 = 61;
                                                                                                                              }
                                                                                                                            }
                                                                                                                            else
                                                                                                                            {
                                                                                                                              uint64_t v18 = 60;
                                                                                                                            }
                                                                                                                          }
                                                                                                                          else
                                                                                                                          {
                                                                                                                            uint64_t v18 = 59;
                                                                                                                          }
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                          uint64_t v18 = 58;
                                                                                                                        }
                                                                                                                      }
                                                                                                                      else
                                                                                                                      {
                                                                                                                        uint64_t v18 = 57;
                                                                                                                      }
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                      uint64_t v18 = 56;
                                                                                                                    }
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                    uint64_t v18 = 55;
                                                                                                                  }
                                                                                                                }
                                                                                                                else
                                                                                                                {
                                                                                                                  uint64_t v18 = 54;
                                                                                                                }
                                                                                                              }
                                                                                                              else
                                                                                                              {
                                                                                                                uint64_t v18 = 53;
                                                                                                              }
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                              uint64_t v18 = 52;
                                                                                                            }
                                                                                                          }
                                                                                                          else
                                                                                                          {
                                                                                                            uint64_t v18 = 51;
                                                                                                          }
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                          uint64_t v18 = 50;
                                                                                                        }
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        uint64_t v18 = 49;
                                                                                                      }
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      uint64_t v18 = 48;
                                                                                                    }
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    uint64_t v18 = 47;
                                                                                                  }
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  uint64_t v18 = 46;
                                                                                                }
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                uint64_t v18 = 45;
                                                                                              }
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              uint64_t v18 = 44;
                                                                                            }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            uint64_t v18 = 43;
                                                                                          }
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          uint64_t v18 = 42;
                                                                                        }
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        uint64_t v18 = 41;
                                                                                      }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      uint64_t v18 = 40;
                                                                                    }
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    uint64_t v18 = 39;
                                                                                  }
                                                                                }
                                                                                else
                                                                                {
                                                                                  uint64_t v18 = 38;
                                                                                }
                                                                              }
                                                                              else
                                                                              {
                                                                                uint64_t v18 = 37;
                                                                              }
                                                                            }
                                                                            else
                                                                            {
                                                                              uint64_t v18 = 36;
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            uint64_t v18 = 35;
                                                                          }
                                                                        }
                                                                        else
                                                                        {
                                                                          uint64_t v18 = 34;
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        uint64_t v18 = 33;
                                                                      }
                                                                    }
                                                                    else
                                                                    {
                                                                      uint64_t v18 = 32;
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    uint64_t v18 = 31;
                                                                  }
                                                                }
                                                                else
                                                                {
                                                                  uint64_t v18 = 30;
                                                                }
                                                              }
                                                              else
                                                              {
                                                                uint64_t v18 = 29;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              uint64_t v18 = 28;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            uint64_t v18 = 27;
                                                          }
                                                        }
                                                        else
                                                        {
                                                          uint64_t v18 = 26;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        uint64_t v18 = 25;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      uint64_t v18 = 24;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    uint64_t v18 = 23;
                                                  }
                                                }
                                                else
                                                {
                                                  uint64_t v18 = 22;
                                                }
                                              }
                                              else
                                              {
                                                uint64_t v18 = 21;
                                              }
                                            }
                                            else
                                            {
                                              uint64_t v18 = 20;
                                            }
                                          }
                                          else
                                          {
                                            uint64_t v18 = 19;
                                          }
                                        }
                                        else
                                        {
                                          uint64_t v18 = 18;
                                        }
                                      }
                                      else
                                      {
                                        uint64_t v18 = 17;
                                      }
                                    }
                                    else
                                    {
                                      uint64_t v18 = 16;
                                    }
                                  }
                                  else
                                  {
                                    uint64_t v18 = 15;
                                  }
                                }
                                else
                                {
                                  uint64_t v18 = 14;
                                }
                              }
                              else
                              {
                                uint64_t v18 = 13;
                              }
                            }
                            else
                            {
                              uint64_t v18 = 12;
                            }
                          }
                          else
                          {
                            uint64_t v18 = 11;
                          }
                        }
                        else
                        {
                          uint64_t v18 = 10;
                        }
                      }
                      else
                      {
                        uint64_t v18 = 9;
                      }
                    }
                    else
                    {
                      uint64_t v18 = 8;
                    }
                  }
                  else
                  {
                    uint64_t v18 = 7;
                  }
                }
                else
                {
                  uint64_t v18 = 6;
                }
              }
              else
              {
                uint64_t v18 = 5;
              }
            }
            else
            {
              uint64_t v18 = 4;
            }
          }
        }
        else
        {
          uint64_t v18 = 2;
        }
      }
      else
      {
        uint64_t v18 = 1;
      }

      [(_CPResultSectionForFeedback *)v5 setKnownBundleIdentifier:v18];
      goto LABEL_375;
    }
LABEL_195:

    long long v19 = [v4 bundleIdentifier];
    v20 = (void *)[v19 copy];
    [(_CPResultSectionForFeedback *)v5 setBundleIdentifier:v20];
  }
LABEL_375:
  -[_CPResultSectionForFeedback setIsInitiallyHidden:](v5, "setIsInitiallyHidden:", [v4 isInitiallyHidden]);
  -[_CPResultSectionForFeedback setTotalAvailableResults:](v5, "setTotalAvailableResults:", [v4 totalAvailableResults]);
  uint64_t v21 = [v4 titleButtonItem];

  if (v21)
  {
    v22 = [_CPButtonForFeedback alloc];
    int v23 = [v4 titleButtonItem];
    uint64_t v24 = [(_CPButtonForFeedback *)v22 initWithFacade:v23];
    [(_CPResultSectionForFeedback *)v5 setTitleButtonItem:v24];
  }
  v25 = v5;

LABEL_378:
  return v5;
}

@end