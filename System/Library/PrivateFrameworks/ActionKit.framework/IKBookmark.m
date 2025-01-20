@interface IKBookmark
+ (id)bookmarkWithBookmarkID:(int64_t)a3;
- (BOOL)isStarred;
- (IKBookmark)init;
- (IKBookmark)initWithBookmarkID:(int64_t)a3;
- (NSDate)date;
- (NSDate)progressDate;
- (NSString)descr;
- (NSString)hashString;
- (NSString)privateSource;
- (NSString)title;
- (NSURL)URL;
- (double)progress;
- (id)description;
- (int64_t)bookmarkID;
- (void)dealloc;
- (void)setBookmarkID:(int64_t)a3;
- (void)setDate:(id)a3;
- (void)setDescr:(id)a3;
- (void)setHashString:(id)a3;
- (void)setPrivateSource:(id)a3;
- (void)setProgress:(double)a3;
- (void)setProgressDate:(id)a3;
- (void)setStarred:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation IKBookmark

- (void)setProgressDate:(id)a3
{
}

- (NSDate)progressDate
{
  return self->_progressDate;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setHashString:(id)a3
{
}

- (NSString)hashString
{
  return self->_hashString;
}

- (void)setPrivateSource:(id)a3
{
}

- (NSString)privateSource
{
  return self->_privateSource;
}

- (void)setStarred:(BOOL)a3
{
  self->_starred = a3;
}

- (BOOL)isStarred
{
  return self->_starred;
}

- (void)setDate:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDescr:(id)a3
{
}

- (NSString)descr
{
  return self->_descr;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setURL:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setBookmarkID:(int64_t)a3
{
  self->_bookmarkID = a3;
}

- (int64_t)bookmarkID
{
  return self->_bookmarkID;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IKBookmark;
  [(IKBookmark *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %@ (%ld), URL:(%@)>", NSStringFromClass(v4), -[IKBookmark title](self, "title"), -[IKBookmark bookmarkID](self, "bookmarkID"), -[IKBookmark URL](self, "URL")];
}

- (IKBookmark)initWithBookmarkID:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IKBookmark;
  result = [(IKBookmark *)&v5 init];
  if (result)
  {
    result->_bookmarkID = a3;
    *(_OWORD *)&result->_URL = 0u;
    *(_OWORD *)&result->_descr = 0u;
    result->_starred = 0;
    result->_privateSource = 0;
    result->_hashString = 0;
    result->_progress = -1.0;
    result->_progressDate = 0;
  }
  return result;
}

- (IKBookmark)init
{
  return [(IKBookmark *)self initWithBookmarkID:0x7FFFFFFFFFFFFFFFLL];
}

+ (id)bookmarkWithBookmarkID:(int64_t)a3
{
  objc_super v3 = [[IKBookmark alloc] initWithBookmarkID:a3];
  return v3;
}

@end