@interface MUEVChargerAvailabilityDownloader
- (BOOL)isActive;
- (MUEVChargerAvailabilityDownloader)initWithMapItemIdentifier:(id)a3;
- (MUEVChargerAvailabilityDownloaderDelegate)delegate;
- (_TtC6MapsUI31EVChargerAvailabilityDownloader)downloader;
- (void)didDownloadEVChargerAvailabilityWithEvCharger:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownloader:(id)a3;
- (void)setIsActive:(BOOL)a3;
@end

@implementation MUEVChargerAvailabilityDownloader

- (MUEVChargerAvailabilityDownloader)initWithMapItemIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUEVChargerAvailabilityDownloader;
  v5 = [(MUEVChargerAvailabilityDownloader *)&v9 init];
  if (v5)
  {
    v6 = [[_TtC6MapsUI31EVChargerAvailabilityDownloader alloc] initWithMapItemIdentifier:v4];
    [(MUEVChargerAvailabilityDownloader *)v5 setDownloader:v6];

    v7 = [(MUEVChargerAvailabilityDownloader *)v5 downloader];
    [v7 setDelegate:v5];
  }
  return v5;
}

- (void)setIsActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MUEVChargerAvailabilityDownloader *)self downloader];
  [v4 setIsActive:v3];
}

- (void)didDownloadEVChargerAvailabilityWithEvCharger:(id)a3
{
  id v8 = a3;
  id v4 = [(MUEVChargerAvailabilityDownloader *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(MUEVChargerAvailabilityDownloader *)self delegate];
    v7 = [v8 plugs];
    [v6 evChargerAvailabilityDownloader:self didDownloadAvailabilityWithPlugs:v7];
  }
}

- (MUEVChargerAvailabilityDownloaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUEVChargerAvailabilityDownloaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (_TtC6MapsUI31EVChargerAvailabilityDownloader)downloader
{
  return self->_downloader;
}

- (void)setDownloader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloader, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end