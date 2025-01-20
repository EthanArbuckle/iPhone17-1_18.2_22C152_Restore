@interface CUIKRecentContactWithImage
- (CRRecentContact)recent;
- (EKStructuredLocation)location;
- (UIImage)image;
- (id)conferenceRoomForSource:(id)a3;
- (id)description;
- (void)setImage:(id)a3;
- (void)setRecent:(id)a3;
@end

@implementation CUIKRecentContactWithImage

- (EKStructuredLocation)location
{
  v3 = [(CUIKRecentContactWithImage *)self recent];
  BOOL v4 = +[CUIKRecents recentIsDirectoryLocation:v3];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v6 = [(CUIKRecentContactWithImage *)self recent];
    v5 = +[CUIKRecents locationForRecent:v6];
  }

  return (EKStructuredLocation *)v5;
}

- (id)conferenceRoomForSource:(id)a3
{
  id v4 = a3;
  v5 = [(CUIKRecentContactWithImage *)self recent];
  BOOL v6 = +[CUIKRecents recentIsDirectoryLocation:v5];

  if (v6)
  {
    v7 = [(CUIKRecentContactWithImage *)self recent];
    v8 = +[CUIKRecents directoryLocationForRecent:v7 onSource:v4];

    v9 = objc_opt_new();
    [v9 setLocation:v8];
    [v9 setAvailability:0];
    v10 = [v4 constraints];
    objc_msgSend(v9, "setSupportsAvailability:", objc_msgSend(v10, "supportsAvailabilityRequests"));
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  v2 = [(CUIKRecentContactWithImage *)self recent];
  v3 = [v2 description];

  return v3;
}

- (CRRecentContact)recent
{
  return self->_recent;
}

- (void)setRecent:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_recent, 0);
}

@end